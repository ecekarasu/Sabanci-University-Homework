#include <stdio.h>
#include <string.h>
#include <dirent.h> // for struct dirent
#include <sys/stat.h>
#include <stdlib.h>

#define MAX_LINE_LEN 1024
#define MAX_NAME_LEN 32

typedef struct person {
  char gender;
  char first_name[MAX_LINE_LEN];
  char last_name[MAX_NAME_LEN];
} person;

person db[100];
int db_size = 0;

void load_db(const char *db_file) {
  FILE *fptr = fopen(db_file, "r");
  if (fptr == NULL) {
    printf("database file cannot be opened\n");
    return;
  }
  char line[MAX_LINE_LEN];
  while (fgets(line, MAX_LINE_LEN, fptr) != NULL) {
    if (sscanf(line, "%c %s %s", &db[db_size].gender, db[db_size].first_name, db[db_size].last_name) == 3) {
      db_size++;
    }
  }
  fclose(fptr);
}

void correct_txt_content(const char *path) {
  FILE *txt_file = fopen(path, "r+");
  if (txt_file == NULL) {
    printf("txt file cannot be opened\n");
    return;
  }
  if (strstr(path, "database.txt") != NULL) { // if the txt file and db file are the same
    return;
  }
  fseek(txt_file, 0, SEEK_END); // move the file pointer to the end of the file
  long int size = ftell(txt_file); 
  char* line = (char*) malloc(size * sizeof(char)); // a char array to hold the content of the file
  fseek(txt_file, 0, SEEK_SET); // move the file pointer to the beginning of the file
  fread(line, sizeof(char), size, txt_file);

  int i;
  for (i = 0; i < db_size; i++) {
    int index = 0;
    int flag = 1;
    while (flag) {
      char *check = strstr(line + index, db[i].first_name);
      if (check != NULL) { // found a match
        int first_name_idx = check - line;
        index = first_name_idx + 1;
        int title_idx = first_name_idx - 4;
        char title[3];
        if (sscanf(line + title_idx, "%3s", title) == 1) { 
          char correct_title[3];
          if (db[i].gender == 'm') {
            strcpy(correct_title, "Mr.");
          }
          else if (db[i].gender == 'f') {
            strcpy(correct_title, "Ms.");
          }
          if (strcmp(title, correct_title) != 0) { // title is incorrect
            fseek(txt_file, title_idx, SEEK_SET);
            fputs(correct_title, txt_file);
          } 
        }
        int last_name_idx = title_idx + 4 + strlen(db[i].first_name) + 1; // title_idx + title + len_first_name + space
        char last_name[MAX_LINE_LEN];
        if (sscanf(line + last_name_idx, "%s", last_name) == 1) {
          if (strcmp(last_name, db[i].last_name) != 0) { // last name is incorrect
            fseek(txt_file, last_name_idx, SEEK_SET);
            fputs(db[i].last_name, txt_file);
          }
        }
      }
      else{
        flag = 0;
      }
    }
  }
  free(line);
  fclose(txt_file);
}

void traverse_dir(const char *path) {
  struct stat sb;
  if (stat(path, &sb) == -1) {
    perror("file stats cannot be gotten");
    return;
  } 
  if (S_ISDIR(sb.st_mode)) { // the file is a directory
    DIR *dir = opendir(path);
    if (dir == NULL) {
      perror("the directory cannot be opened");
      return;
    }
    struct dirent *dir_entry;
    while ((dir_entry = readdir(dir)) != NULL) {
      if (strcmp(dir_entry->d_name, ".") == 0 || strcmp(dir_entry->d_name, "..") == 0) {
        continue;
      }
      char sub_path[MAX_LINE_LEN];
      snprintf(sub_path, MAX_LINE_LEN, "%s/%s", path, dir_entry->d_name);
      traverse_dir(sub_path); // recursively traverse the directory
    }
    closedir(dir);
  }
  else { // base case: the file is a leaf file
    if (strstr(path, ".txt") != NULL) { 
      correct_txt_content(path);
    }
  }
}

int main(int argc, char *argv[]) {
  load_db("database.txt");
  traverse_dir(".");
  return 0;
}
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <stdbool.h>
#include <fcntl.h>
#include <assert.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <pthread.h>

struct Command {
    char* name;
    char* input;
    char* option;
    char* redirection;
    char* file_name;
    char* background;
    };

struct Myargs_struct {
    char **myargs_return;
    int size_of;
    };

pthread_mutex_t mutex;

void *mythread(void *args) {
    struct Command *cmd = args;
    // implementing command executions
    if (strstr(cmd->redirection, "-") != NULL) {
        printf("--- %ld\n", (long) pthread_self());
        int num_of_components = 1; // to decide how many elements will be in the array
        if (cmd->input[0] != '\0') { // enters if there is input
            num_of_components++;
        }
        if (cmd->option[0] != '\0') { // enters if there is option
            num_of_components++;
        }
        char *myargs[num_of_components];
        myargs[0] = strdup(cmd->name);
        int k = 1;
        if (cmd->input[0] != '\0') {
            myargs[k] = strdup(cmd->input);
            k++;
        }
        if (cmd->option[0] != '\0') { 
            myargs[k] = strdup(cmd->option);
            k++;
        }
        myargs[k] = NULL;  
        
        char **myargs_return = malloc(sizeof(myargs));
        myargs_return = myargs;
        struct Myargs_struct myargs_struct;
        myargs_struct.myargs_return = myargs_return;
        myargs_struct.size_of = sizeof(myargs);
        struct Myargs_struct * myargs_struct_return = malloc(8+sizeof(int));
        *myargs_struct_return = myargs_struct;
        
        printf("--- %ld\n", (long) pthread_self());
        return (void*) myargs_struct_return;
    }
    // implementing redirectioning
    else {
        int file;
        if (strstr(cmd->redirection, "<") == NULL) { // redirection symbol is >
            file = open(cmd->file_name, O_WRONLY | O_CREAT, 0777); // for redirectioning part
            dup2(file, STDOUT_FILENO);
            close(file);
        }
        else { // redirection symbol is <
            file = open(cmd->file_name, O_RDONLY, 0);
            dup2(file, STDIN_FILENO);
            close(file);
        }
        int num_of_components = 1; // to decide how many elements will be in the array
        if (cmd->input[0] != '\0') { // enters if there is input
            num_of_components++;
        }
        if (cmd->option[0] != '\0') { // enters if there is option
            num_of_components++;    
        }
        char *myargs[num_of_components];
        myargs[0] = strdup(cmd->name);
        int k = 1;
        if (cmd->input[0] != '\0') {
            myargs[k] = strdup(cmd->input);
            k++;
        }
        if (cmd->option[0] != '\0') { 
            myargs[k] = strdup(cmd->option);
            k++;
        }
        myargs[k] = NULL;

        char **myargs_return = malloc(sizeof(myargs));
        myargs_return = myargs;
        struct Myargs_struct myargs_struct;
        myargs_struct.myargs_return = myargs_return;
        myargs_struct.size_of = sizeof(myargs);
        struct Myargs_struct * myargs_struct_return = malloc(8+sizeof(int));
        *myargs_struct_return = myargs_struct;
        
        printf("--- %ld\n", (long) pthread_self());
        return (void*) myargs_struct_return;
    }
    // pthread_exit(NULL);
}

int main(int argc, char *argv[]) {

    FILE* file_to_read = fopen("commands.txt", "r");
    FILE* file_to_write = fopen("parse.txt", "w");

    char line[100];
    int num_lines = 0;
    int num_line_to_track = 0;
    char* token;

    char* copy_name;
    char* copy_input;
    char* copy_option;
    char* copy_redirection;
    char* copy_file_name;
    char* copy_background;

    if (file_to_write == NULL){
        printf("file to write cannot be opened\n");
    }
    else {
        if (file_to_read == NULL) {
            printf("file to read cannot be opened\n");
        }
        else {
            // this loop is to get the number of lines
            while (fgets(line, sizeof(line), file_to_read)) {
                num_lines++;
            }
            rewind(file_to_read);
            struct Command cmd_list[num_lines];

            // COMMAND FORMAT: cmd_name [input] [option] [> | < file name] [&]
            while (fgets(line, sizeof(line), file_to_read)) {
                line[strcspn(line, "\n")] = 0;
                struct Command cmd;
                cmd.name = "";
                cmd.input = "";
                cmd.option = "";
                cmd.redirection = "-";
                cmd.file_name = "";
                cmd.background = "n";

                int wordCountToTrack = 1;
                token = strtok(line, " ");
                copy_name = malloc(strlen(token) + 1);
                strcpy(copy_name, token);
                cmd.name = copy_name;

                while (token != NULL) {
                    token = strtok(NULL, " ");
                    wordCountToTrack++;
                    if (token != NULL) {
                        if (wordCountToTrack == 2) {
                            // there is option
                            if (token[0] == '-') {
                                copy_option = malloc(strlen(token) + 1);
                                strcpy(copy_option, token);
                                cmd.option = copy_option;
                            }
                            // there is redirectioning
                            else if (token[0] == '<' || token[0] == '>') {
                                copy_redirection = malloc(strlen(token) + 1);
                                strcpy(copy_redirection, token);
                                cmd.redirection = copy_redirection;
                            }
                            // the command will run in the background
                            else if (token[0] == '&') {
                                copy_background = malloc(strlen(token) + 1);
                                strcpy(copy_background, "y");
                                cmd.background = copy_background;
                            }
                            // there is input
                            else {
                                copy_input = malloc(strlen(token) + 1);
                                strcpy(copy_input, token);
                                cmd.input = copy_input;
                            }
                        }
                        else if (wordCountToTrack == 3) {
                            // there is option
                            if (token[0] == '-') {
                                copy_option = malloc(strlen(token) + 1);
                                strcpy(copy_option, token);
                                cmd.option = copy_option;
                            }
                            // there is redirectioning
                            else if (token[0] == '<' || token[0] == '>') {
                                copy_redirection = malloc(strlen(token) + 1);
                                strcpy(copy_redirection, token);
                                cmd.redirection = copy_redirection;
                            }
                            // the command will run in the background
                            else if (token[0] == '&') {
                                copy_background = malloc(strlen(token) + 1);
                                strcpy(copy_background, "y");
                                cmd.background = copy_background;
                            }
                            // the file name for redirectioning
                            else if (strstr(token, ".txt") != NULL) {
                                copy_file_name = malloc(strlen(token) + 1);
                                strcpy(copy_file_name, token);
                                cmd.file_name = copy_file_name;
                            }
                        }
                        else if (wordCountToTrack == 4) {
                            // there is redirectioning
                            if (token[0] == '<' || token[0] == '>') {
                                copy_redirection = malloc(strlen(token) + 1);
                                strcpy(copy_redirection, token);
                                cmd.redirection = copy_redirection;
                            }
                            // the command will run in the background
                            else if (token[0] == '&') {
                                copy_background = malloc(strlen(token) + 1);
                                strcpy(copy_background, "y");
                                cmd.background = copy_background;
                            }
                            // the file name for redirectioning
                            else if (strstr(token, ".txt") != NULL) {
                                copy_file_name = malloc(strlen(token) + 1);
                                strcpy(copy_file_name, token);
                                cmd.file_name = copy_file_name;
                            }
                        }
                        else if (wordCountToTrack == 5) {
                            // the command will run in the background
                            if (token[0] == '&') {
                                copy_background = malloc(strlen(token) + 1);
                                strcpy(copy_background, "y");
                                cmd.background = copy_background;
                            }
                            // the file name for redirectioning
                            else if (strstr(token, ".txt") != NULL) {
                                copy_file_name = malloc(strlen(token) + 1);
                                strcpy(copy_file_name, token);
                                cmd.file_name = copy_file_name;
                            }
                        }
                        // the command will run in the background
                        else if (wordCountToTrack == 6) {
                            copy_background = malloc(strlen(token) + 1);
                            strcpy(copy_background, "y");
                            cmd.background = copy_background;
                            // the file name for redirectioning
                            if (strstr(token, ".txt") != NULL) {
                                copy_file_name = malloc(strlen(token) + 1);
                                strcpy(copy_file_name, token);
                                cmd.file_name = copy_file_name;
                            }
                        }
                        else {
                            printf("error\n");
                        }
                    }
                }
                fprintf(file_to_write, "----------\n");
                fprintf(file_to_write, "Command: %s\n", cmd.name);
                fprintf(file_to_write, "Inputs: %s\n", cmd.input);
                fprintf(file_to_write, "Options: %s\n", cmd.option);
                fprintf(file_to_write, "Redirection: %s\n", cmd.redirection);
                fprintf(file_to_write, "Background Job: %s\n", cmd.background);
                fprintf(file_to_write, "----------\n");

                copy_name = NULL;
                copy_input = NULL;
                copy_option = NULL;
                copy_redirection = NULL;
                copy_file_name = NULL;
                copy_background = NULL;

                cmd_list[num_line_to_track] = cmd;
                num_line_to_track++;
            }

            fclose(file_to_read);
            fclose(file_to_write);

            size_t num_of_cmd = sizeof(cmd_list)/sizeof(cmd_list[0]);
            pthread_t threads[num_of_cmd];

            int rc = fork(); 
            if (rc < 0) {
                fprintf(stderr, "fork failed\n");
                exit(1);
            }
            else if (rc == 0) {
                int i;
                for (i = 0; i < num_of_cmd; i++) {
                    if (strstr(cmd_list[i].name, "wait") != NULL) { // the command is wait
                        wait(NULL);
                    }
                    else {
                        int thread_check = pthread_create(&threads[i], NULL, mythread, &cmd_list[i]);
                        if(thread_check != 0) { printf("error creating threadn\n"); }
                    }
                } 
                size_t num_of_threads = sizeof(threads)/sizeof(threads[0]);
                int j;
                for (j = 0; j < num_of_threads; j++) {
                    char **myargs;
                    int size_of;
                    struct Myargs_struct * myargs_struct_return;
                    pthread_join(threads[j],(void **) & myargs_struct_return);

                    size_of = myargs_struct_return->size_of;
                    myargs = myargs_struct_return->myargs_return;

                    size_t num_of_myargs = size_of/sizeof(myargs[0]);
                    int rc_inside = fork(); 
                    
                    if(rc_inside<0){
                        fprintf(stderr, "fork failed\n");
                        exit(1);
                    }
                    else if(rc_inside==0){
                        execvp(myargs[0], myargs); 
                    }
                    else{
                        // wait(NULL);
                    }
                }
                exit(0);
            }
            else{
                wait(NULL);
            }
        }
    }
	return 0;
}
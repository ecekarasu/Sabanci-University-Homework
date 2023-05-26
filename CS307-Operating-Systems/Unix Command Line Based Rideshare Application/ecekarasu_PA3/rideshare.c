#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <stdbool.h>
#include <fcntl.h>
#include <assert.h>
#include <sys/wait.h>
#include <pthread.h>

pthread_mutex_t print_mutex;
pthread_mutex_t add_mutex;
pthread_mutex_t check_mutex;
pthread_cond_t cond;

// contains the arguments to pass to thread function
typedef struct thread_args{
  char team;
  int dummy_idx;
  bool is_seated;
} thread_args;

#define SIZE 5
thread_args line[SIZE];

#define INDEX 0
int idx = INDEX;
int occupied_seats = INDEX; 
int curr_looking = 0;
bool wait_flag = false;

void* thread_func(void* args) {
    thread_args* new_args = (thread_args*)args;
    bool is_driver_found = false; 
    while(wait_flag){}

    pthread_mutex_lock(&print_mutex);
    curr_looking++;

    printf("Thread ID: %ld, Team: %c, I am looking for a car.\n", (long)pthread_self(), new_args->team);
    pthread_mutex_unlock(&print_mutex);

    // adding the current thread to the line
    pthread_mutex_lock(&add_mutex);
    int idx_copy = idx;
    idx++;
    line[idx_copy].team = new_args->team;
    line[idx_copy].dummy_idx = idx_copy;
    line[idx_copy].is_seated = new_args->is_seated;
    pthread_mutex_unlock(&add_mutex);

    pthread_mutex_lock(&check_mutex);
    // checking for a valid combination 
    int curr_numA = 0;
    int curr_numB = 0;
    int idx_list_A[4];
    int idx_list_B[4];
    if (idx_copy == 0) {
        if (line[idx_copy].team == 'A') {
            curr_numA++;
            idx_list_A[0] = idx_copy;
        }
        else {
            curr_numB++;
            idx_list_B[0] = idx_copy;
        }
    }
    else {
        for (int i = 0; i <= idx_copy; i++) {
            if(line[i].team == 'A') {
                // printf("currA: %d\n",line[i].dummy_idx);
                idx_list_A[curr_numA] = line[i].dummy_idx;
                curr_numA++;
            }
            else {
                // printf("currB: %d\n",line[i].dummy_idx);
                idx_list_B[curr_numB] = line[i].dummy_idx;
                curr_numB++;

            }
        }
    }
    if (line[idx_copy].team == 'A') {
        if (curr_numA == 4) {
            is_driver_found = true;
            for (int i = 0; i < 4; i++) {
                line[idx_list_A[i]].is_seated = true;
            }
        }
        else if (curr_numA == 2 && curr_numB == 2) {
            is_driver_found = true;
            for (int i = 0; i < 2; i++) {
                line[idx_list_A[i]].is_seated = true;
            }
            for (int i = 0; i < 2; i++) {
                line[idx_list_B[i]].is_seated = true;
            }
        }
    }
    else { 
        if (curr_numB == 4) {
            is_driver_found = true;
            for (int i = 0; i < 4; i++) {
                line[idx_list_B[i]].is_seated = true;
            }
        }
        else if (curr_numB == 2 && curr_numA == 2) {
            is_driver_found = true;
            for (int i = 0; i < 2; i++) {
                line[idx_list_A[i]].is_seated = true;
            }
            for (int i = 0; i < 2; i++) {
                line[idx_list_B[i]].is_seated = true;
            }
        }
    }
    pthread_mutex_unlock(&check_mutex);
    if(is_driver_found)wait_flag = true;
    // printf("entering %ld\n",(long)pthread_self());
    while (!line[idx_copy].is_seated) {}
    // printf("exiting %ld\n",(long)pthread_self());
    pthread_mutex_lock(&print_mutex);
    printf("Thread ID: %ld, Team: %c, I have found a spot in a car.\n", (long)pthread_self(), line[idx_copy].team);
    occupied_seats++;
    pthread_mutex_unlock(&print_mutex);

    while (is_driver_found && occupied_seats != 4){}
    pthread_mutex_lock(&print_mutex);

    if (is_driver_found && occupied_seats == 4) {
        printf("Thread ID: %ld, Team: %c, I am the captain and driving the car\n", (long)pthread_self(),line[idx_copy].team);
        occupied_seats = 0;
        curr_looking = 0;
        wait_flag = false;
        int re_idx = 0;
        for (int i = 0; i < 5; i++) {
            if (!line[i].is_seated) {
                line[re_idx] = line[i];
                re_idx++;
            }
            else {
                line[i].team = '\0';
                line[i].dummy_idx = 0;
                line[i].is_seated = false;
            }
        }
        idx = re_idx;
        pthread_cond_signal(&cond);
    }
    pthread_mutex_unlock(&print_mutex);

}

int main(int argc, char *argv[3]) {
    int numA = atoi(argv[1]);
    int numB = atoi(argv[2]);
    
    if (numA % 2 != 0 || numB % 2 != 0 || (numA + numB) % 4 != 0) { 
        printf("The main terminates\n");
    }
    else {
        pthread_mutex_init(&print_mutex, NULL);
        pthread_mutex_init(&add_mutex, NULL);
        pthread_mutex_init(&check_mutex, NULL);
        pthread_cond_init(&cond, NULL);
        pthread_t threads[numA + numB];

        int count = 0;
        int numA_copy = numA;
        int numB_copy = numB;

        // creating the threads
        for (int i = 0; i < (numA + numB); i++) {
            if (numA_copy > 0) {
                thread_args args = {'A', 0, false};
                pthread_create(&threads[count], NULL, &thread_func, &args);
                numA_copy--;
                count++;
            }
            else{
                thread_args args = {'B', 0, false};
                pthread_create(&threads[count], NULL, &thread_func, &args);
                numB_copy--;
                count++;
            }
        }
        // joining the threads
        for (int i = 0; i < (numA + numB); i++) {
            pthread_join(threads[i], NULL);
        }
        printf("The main terminates\n");
    }
    pthread_mutex_destroy(&print_mutex);
    pthread_mutex_destroy(&add_mutex);
    pthread_mutex_destroy(&check_mutex);
    pthread_cond_destroy(&cond);

    return 0;
}
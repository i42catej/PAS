#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <mqueue.h>
#include <sys/wait.h>
#include <errno.h>
#include <time.h>



int main (){

	int vtub[2],i,j,status,died,numaleatorio;
	pid_t pid;
	int buffer[5];
	ssize_t nbytes;

	status = pipe(vtub);
	if(status==-1){
		printf ("Error al crear la tuberia pipe \n");
		exit(1);
	}

	pid=fork();

	switch (pid){
		case -1:
			printf("Error al crear el proceso hijo\n");
			exit(1);
		case 0:
			printf("[HIJO]: Mi PID es %d y mi PPID es %d\n",getpid(),getppid());
			close(vtub[1]); 

			for(i=0;i<5;i++){
				read(vtub[0],&buffer[i],sizeof(buffer[i]));
				printf("[HIJO]: Leemos el numero aleatorio %d de la tuberia\n",buffer[i]);
			}

			close(vtub[0]);
			printf("[HIJO]: tuberia cerrada. Salgo...\n");
			break;

		default:
			printf("[PADRE]: Mi PID es %d y el PID de mi hijo es %d\n",getpid(),pid);
			close (vtub[0]);

			srand(time(NULL));

			for(j=0;j<5;j++){
				numaleatorio= rand()%5000;
				write(vtub[1],&numaleatorio,sizeof(numaleatorio));
				printf("[PADRE]: Escribimos el numero aleatorio %d en la tuberia...\n",numaleatorio);
			}

			close(vtub[1]);

			printf("[PADRE]: Tuberia cerrada.\n");
	}		
 exit(0);
}

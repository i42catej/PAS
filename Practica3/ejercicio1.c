#include <string.h>
#include <unistd.h>
#include <stdio.h>
#include <ctype.h>
#include <sys/types.h>
#include <stdlib.h>
#include <grp.h>
#include <pwd.h>
#include <getopt.h>

void imprimir(struct passwd *pw, int opcion){


	if(opcion==0){

		printf("User name: %s\n",pw->pw_name);
		printf("User id: %d\n",pw->pw_uid);
		printf("Password: %s\n",pw->pw_passwd);
		printf("Home: %s\n",pw->pw_dir);
		printf("Default shell: %s\n",pw->pw_shell);

	} else {


		printf("Nombre de usuario: %s\n",pw->pw_name);
		printf("Identificador de usuario: %d\n",pw->pw_uid);
		printf("Contraseña: %s\n",pw->pw_passwd);
		printf("Carpeta de inicio: %s\n", pw->pw_dir);
		printf("Interprete por defecto: %s\n",pw->pw_shell);
		
	}

}







int main (int argc, char *argv[]){


	int sflag=0;	
	int eflag=0;
	int gflag=0;
	char *uvalue=NULL;
	int index;
	int c;




	/* Las variables optind, optarg y optopt las declara y actualiza
       implíticamente getopt()
    */

    	opterr = 0;

	while ((c=getopt (argc,argv,"segn:"))!= -1){
		switch(c){
			case 's':{
				if(eflag){
					printf("Error, se debe indicar un solo idioma\n");
					return 1;
				}
			   sflag=1;
			   break;}
			
			case 'e':{
				if(sflag){
					printf("Error, se debe indicar un solo idioma\n");
					return 1;
				}
                           eflag=1;
			   break;}

			
			case 'n':{
				uvalue=optarg;
			   break;}
				
			case 'g':{
				gflag=1;
			   break;}

			case '?':{
				if (optopt=='n') //Duda
			                fprintf (stderr, "La opcion -%c requiere un argumento.\n", optopt);
     				else if (isprint (optopt))
					fprintf (stderr, "Opcion desconocida '-%c'.\n", optopt);
        			else
                			fprintf (stderr, "Caracter `\\x%x'.\n", optopt);
			   return 1;}
			   
			default:
			   abort();
		}
	}


	/* Esta último bucle controla opciones introducidas por el usuario
       que no hayan sido procesadas. Compara el número de argumentos recibidos
       con el número de opciones reconocidas. Como getopt() internamente
       reordena los valores de argv, las primeras posiciones de argv corresponden
       a opciones conocidas y las últimas, a partir de optind, a opciones no
       reconocidas */

    for (index = optind; index < argc; index++)
        printf ("Argumento de la línea de comandos que NO es una opción %s\n", argv[index]);


  char *lgn; 
  struct group *gr;
  struct passwd *pw;  
  const char *user="USER";
  const char *lang="LANG";
  char *valueUser;
  char *valueLang;
  valueLang = getenv(lang);
  valueUser = getenv(user);

	if(sflag==0 && eflag==0){
		
		if(strstr(valueLang,"ES")){
			if(uvalue==NULL){
				uvalue=valueUser;
			}
			lgn=uvalue;

			if((pw=getpwnam(lgn))==NULL){
				fprintf(stderr,"Informacion sobre el usuario incorrecta\n");
				exit(1);
			}

			imprimir(pw,0);

			if(gflag==1){
				gr=getgrgid(pw->pw_gid);
				printf("Nombre del grupo:%s\n",gr->gr_name);
			}
		} else {

			if(uvalue==NULL){
				uvalue=valueUser;
			}

			lgn=uvalue;

			if((pw=getpwnam(lgn))==NULL){
				fprintf(stderr, "The user doesn't exist\n");
				exit(1);
			}
			imprimir(pw,1);
			
			if(gflag==1){
				gr=getgrgid(pw->pw_gid);
				printf("Name Group: %s\n",gr->gr_name);
			}


		}

	}


	if (sflag==1){
		
		if (uvalue==NULL){
			uvalue=valueUser;		
		}
		
		lgn=uvalue;
		if ((pw=getpwnam(lgn))==NULL){
			fprintf (stderr, "The user doesn't exist\n");
			exit(1);
		}		
		imprimir(pw,1);
		if (gflag==1){
			gr = getgrgid(pw->pw_gid);
   			printf("Name Group:%s\n", gr->gr_name);
		}
	}


	if (eflag==1){
		if (uvalue==NULL){
			uvalue=valueUser;		
		}
			
		lgn=uvalue;
		if ((pw=getpwnam(lgn))==NULL){
			fprintf (stderr, "Informacion sobre el usuario incorrecta.\n");
			exit(1);
		}	
	
		imprimir(pw,0);
		if (gflag==1){
			gr = getgrgid(pw->pw_gid);
   			printf("Nombre del grupo:%s\n", gr->gr_name);
		}
	}




 return 0;

}

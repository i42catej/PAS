#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <sys/types.h>
#include <unistd.h>
#include <grp.h>
#include <pwd.h>
#include <getopt.h>

void imprimir(struct group *gr, int opcion){
	
	
	if(opcion==0){
		printf ("Group Identifier: %d\n",gr->gr_gid);		
		printf ("Group name: %s\n",gr->gr_name);
	}else{	
		printf ("Identificador del grupo: %d\n",gr->gr_gid);
		printf ("Nombre del grupo: %s\n",gr->gr_name);
	}
}






int main (int argc, char *argv[]){

	int sflag=0;
	int eflag=0;
	char *gvalue=NULL;
	int index,c;
	int option_index=0;

	opterr=0;

	static struct option long_options[] =
	{
		{"group",required_argument,0, 'h'},
		{"spanish",no_argument,0,'n'},
		{"english",no_argument,0,'z'},
		{"help",no_argument,0,'a'},
		{0, 0, 0, 0}
	};


	while ((c = getopt_long (argc, argv, "seg:h:",
		                long_options, &option_index))!=-1){

		switch(c){

			case 'a':{
				printf("-h, --help               Imprimir esta ayuda\n");
				printf("-g, --group=GRUPO        Grupo a analizar\n");
				printf("-e, --english		 Mensajes en ingles\n");
				printf("-s, --spanish		 Mensajes en castellano\n");
			   exit(0);
			}


			case 's':{
				if(eflag){
					fprintf(stderr,"Error, solo se puede elegir un idioma\n");
					return 1;
				}
				sflag=1;
				break;
			}


			case 'e':{
				if(sflag){
					fprintf(stderr,"Error, solo se puede elegir un idioma\n");
					return 1;
				}
				eflag=1;
				break;
			}

			case 'n':{
				if(eflag){
					fprintf(stderr,"Error, solo se puede elegir un idioma\n");
					return 1;
				}
				sflag=1;				
				break;
			}

			case 'z':{
				if(sflag){
					fprintf(stderr,"Error, solo se puede elegir un idioma\n");
					return 1;
				}
				eflag=1;
				break;
			}

			case 'g':{
				gvalue=optarg;
				break;
			}

			case 'h':{
				gvalue=optarg;
				break;
			}


			case '?':{
				if(optopt=='g')
					fprintf(stderr,"La opcion -%c necesita un argumento\n",optopt);
				 else if (isprint(optopt))
					fprintf(stderr,"La opcion -%c es desconocida\n",optopt);
				 else
					fprintf(stderr,"Caracter '\\x%x'\n",optopt);
				return 1;
			}
			default:
			abort();
		}
	}



  for(index=optind;index<argc;index++){
	printf("%s no es una opcion\n",argv[index]);
  }

  struct passwd *pw;
  struct group *gr;
  const char *user="USER";
  const char *lang="LANG";
  char *usuario;
  char *valueUser;
  char *valueLang;
  valueUser=getenv(user);
  valueLang=getenv(lang);



if (eflag==0 && sflag==0){	
		if (strstr(valueLang,"ES")){
			if (gvalue==NULL){
				if ((pw=getpwnam(valueUser))==NULL){ //Comprobamos si existe el grupo
					fprintf (stderr, "Informacion de grupo incorrecta.\n");
					exit(1);
				}
				gr = getgrgid(pw->pw_gid);
			}else{
				usuario=gvalue;
				if (!getgrnam(gvalue)){
					fprintf (stderr, "Informacion de grupo incorrecta.\n"); 
					exit(1);
				}	
				gr = getgrnam(usuario);
			}

			imprimir(gr,0);
					
				
		}else{
			if (gvalue==NULL){
				if ((pw=getpwnam(valueUser))==NULL){
					fprintf (stderr, "Wrong group information.\n"); //Comprobamos que existe el grupo
					exit(1);
				}	
				gr = getgrgid(pw->pw_gid);	
			}else{
				usuario=gvalue;
				if ((gr=getgrnam(usuario))==NULL){
					fprintf (stderr, "Wrong group information.\n");
					exit(1);
				}
				gr = getgrnam(usuario);	
			}
			imprimir(gr,1);

		}
	}

	if (eflag==1){
			if (gvalue==NULL){
				if ((pw=getpwnam(valueUser))==NULL){
					fprintf (stderr, "Informacion de grupo incorrecta.\n");
					exit(1);
				}
				gr = getgrgid(pw->pw_gid);
			}else{
				usuario=gvalue;
				if (!getgrnam(gvalue)){
					fprintf (stderr, "Informacion de grupo incorrecta.\n");
					exit(1);
				}	
				gr = getgrnam(usuario);
			}

			imprimir(gr,0);
	}

	if (sflag==1){
		if (gvalue==NULL){
			if ((pw=getpwnam(valueUser))==NULL){
				fprintf (stderr, "Wrong group information.\n");
				exit(1);
			}	
			gr = getgrgid(pw->pw_gid);	
		}else{
			usuario=gvalue;
			if ((gr=getgrnam(usuario))==NULL){
				fprintf (stderr, "Wrong group information.\n");
				exit(1);
			}
			gr = getgrnam(usuario);	
		}
			imprimir(gr,1);

	}
 
	
 return 0;
}

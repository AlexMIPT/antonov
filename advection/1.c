#include <stdio.h>
#include <stdlib.h>



save_id(double *x, double *y, int N);

int main() {
	int N, M;
	int C=1; double k=0.6;
	int a;
	double h, t;
	scanf("%i", &N);

	h=((2*C)/(N-1));

printf("%s\n", h);
	t=k*h/C;
	

	int i;
	float q[N];
	for (i=1; i<=M; i++) {
		if (i>N) {
			a=i;
			while (a>N) a=a-N;
			q[a]=(C*t+1-h*i)/(h*(i-1)-1) + 1; 
			
		}
		else
			 {
			q[i]=(C*t+1-h*i)/(h*(i-1)-1) + 1;
	
		}

	}

	return 0;
}


save_id(double *x, double *y, int N) {                                                                                        
                                                                          
                                                                
}

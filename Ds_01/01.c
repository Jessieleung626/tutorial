#include <stdio.h>
#include <math.h>

int main()
{
    int m, n, p;

    scanf("%d %d", &m, &n);
    printf("Sum of ( ");
    for( p=m; p<=n; p++ ) {
        if( prime(p) != 0 )
            printf("%d ", p);
    }
    printf(") = %d\n", PrimeSum(m, n));

    return 0;
}

int prime(int p){
    int i,run=1;

    if(p<2){
        run = 0;
    }
    else{
        for(i=2;i<p;i++){
            if(p%i==0){
                run = 0;
                break;
            }
        }
    }
    return run;
}

int PrimeSum( int m, int n ){
    int sum=0, p;
    for( p=m; p<=n; p++ ) {
        if(prime(p)){
            sum += p;
        }
    }
    return sum;
}

#include <stdio.h>
#include <math.h>

int main()
{
    int m, n, i, cnt;

    scanf("%d %d", &m, &n);
    if ( prime(m) != 0 ) printf("%d is a prime number\n", m);
    if ( m < 6 ) m = 6;
    if ( m%2 ) m++;
    cnt = 0;
    for( i=m; i<=n; i+=2 ) {
        Goldbach(i);
        cnt++;
        if ( cnt%5 ) printf(", ");
        else printf("\n");
    }

    return 0;
}

int prime( int p ){
    int i, run=1;

    if(p<2){
        run=0;
    }
    else{
        for(i=2;i<p;i++){
            if(p%i==0){
                run=0;
                break;
            }
        }
    }
    return run;
}

void Goldbach(int n){
    int i;
    for(i=1;i<=(n+1)/2;i++){
        if(prime(i) && prime(n-i)){
            printf("%d=%d+%d", n, i, n-i);
            break;
        }
    }
}

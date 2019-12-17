#include <stdio.h>
#include <string.h>

#define MAXN 20
typedef enum {false, true} bool;

int main()
{
    char s[MAXN];

    scanf("%s", s);
    if ( palindrome(s)==true )
        printf("Yes\n");
    else
        printf("No\n");
    printf("%s\n", s);

    return 0;
}

bool palindrome( char *s ){
    int i, j;
    int len = sizeof(s);
    for(i=0, j=len; i<=j; i++, j--){
        if(s[i]==s[j]);
        else{
            return 0;
        }
    }
    return 1;
}

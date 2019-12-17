#include <stdio.h>

int main(){
    int start_date, elapse_time, hour, min, elapse_hour, elapse_min, end_hour, end_min;

    scanf("%d %d", &start_date, &elapse_time);
    hour = start_date/100;
    min = start_date%100;

    elapse_hour = elapse_time/60;
    elapse_min = elapse_time%60;

    if(min+elapse_min>=60){
        end_hour = hour + elapse_hour + 1;
        end_min = min + elapse_min -60;
        if(end_min) printf("%d%d", end_hour, end_min);
        else printf("%d%s", end_hour, "00");
    }
    else{
        end_hour = hour + elapse_hour;
        end_min = min + elapse_min;
        printf("%d%d", end_hour, end_min);
    }

    return 0;
}

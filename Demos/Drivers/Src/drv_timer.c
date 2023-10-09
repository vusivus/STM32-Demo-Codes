/*
 * drv_timer.c
 *
 *  Created on: Oct 3, 2023
 *      Author: VT Electronics
 */

#include "drv_timer.h"
#include "main.h"
#include "tim.h"
#include "cmsis_os.h"

extern osMutexId_t delayMutexHandle;

void Timer_Initialize(void){
	HAL_TIM_Base_Start(&htim2);
}


void Timer_ResetUs(void) {
	__HAL_TIM_SET_COUNTER(&htim2, 0);
}

uint16_t Timer_GetUs(void) {
	return __HAL_TIM_GET_COUNTER(&htim2);
}

void DelayUs(volatile uint32_t microseconds) {
	uint32_t start = __HAL_TIM_GET_COUNTER(&htim2);
	while (__HAL_TIM_GET_COUNTER(&htim2) - start < microseconds)
		;
}

void DelayMs(uint32_t milliseconds) {
	osMutexAcquire(delayMutexHandle, portMAX_DELAY);

	__HAL_TIM_SET_COUNTER(&htim2, 0);

	while (milliseconds > 0) {
		DelayUs(1000);
		milliseconds--;
	}

	osMutexRelease(delayMutexHandle);
}

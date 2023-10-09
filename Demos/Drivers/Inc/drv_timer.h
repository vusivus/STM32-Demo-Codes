/*
 * drv_timer.h
 *
 *  Created on: Oct 3, 2023
 *      Author: VT Electronics
 */

#ifndef DRV_TIMER_H
#define DRV_TIMER_H
#include <stdint.h>
#include <stdbool.h>


void Timer_Initialize(void);
void Timer_ResetUs(void);
uint16_t Timer_GetUs(void);
void DelayUs(volatile uint32_t microseconds);
void DelayMs(uint32_t milliseconds);
#endif /* DRIVERS_INC_DRV_TIMER_H_ */

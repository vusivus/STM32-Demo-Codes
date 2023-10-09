/*
 * app.c
 *
 *  Created on: Oct 2, 2023
 *      Author: VT Electronics
 */
#include "FreeRTOS.h"
#include "task.h"
#include "main.h"
#include "cmsis_os.h"
#include "app.h"
#include "adc.h"
#include <stdbool.h>
#include "drv_timer.h"

bool led_state = false;
float sensorValue;

static bool Read_Button(void) {
	if (HAL_GPIO_ReadPin(BUTTON_GPIO_Port, BUTTON_Pin) == GPIO_PIN_RESET) {
		HAL_Delay(50);
		if (HAL_GPIO_ReadPin(BUTTON_GPIO_Port, BUTTON_Pin) == GPIO_PIN_RESET) {
			return true;
		}
	}
	return false;
}

static void LED_SetState(bool state) {
	HAL_GPIO_WritePin(LED_GPIO_Port, LED_Pin, state);
}

static void ADC_SelectChannel(uint32_t channel) {
	ADC_ChannelConfTypeDef sConfig = { 0 };

	sConfig.Channel = channel;
	sConfig.Rank = 1;
	sConfig.SamplingTime = ADC_SAMPLETIME_3CYCLES;
	if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK) {
		Error_Handler();
	}
}

static float Read_Voltage(void) {
	ADC_SelectChannel(ADC_CHANNEL_0);

	HAL_StatusTypeDef status;
	HAL_ADC_Start(&hadc1);

	do {
		status = HAL_ADC_PollForConversion(&hadc1, 10);
	} while (status == HAL_BUSY);

	if (status == HAL_OK) {
		uint32_t value = HAL_ADC_GetValue(&hadc1);
		float voltage = value / 4095.0;

		voltage *= 3.3;

		return voltage;
	}

	return -1;
}

void App_Initialize(void) {
	Timer_Initialize();
}

void App_Update(void) {
	if (Read_Button()) {
		led_state = !led_state;
		LED_SetState(led_state);

		sensorValue = Read_Voltage();
	}

	DelayMs(50);
}

void StartMyTask(void *argument) {

	App_Initialize();

	for (;;) {
		App_Update();
		osDelay(1);
	}
}

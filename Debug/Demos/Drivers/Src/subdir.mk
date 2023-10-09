################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Demos/Drivers/Src/drv_timer.c 

OBJS += \
./Demos/Drivers/Src/drv_timer.o 

C_DEPS += \
./Demos/Drivers/Src/drv_timer.d 


# Each subdirectory must supply rules for building sources it contributes
Demos/Drivers/Src/%.o Demos/Drivers/Src/%.su Demos/Drivers/Src/%.cyclo: ../Demos/Drivers/Src/%.c Demos/Drivers/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xC -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Demos/App/Inc -I../Demos/Drivers/Inc -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Demos-2f-Drivers-2f-Src

clean-Demos-2f-Drivers-2f-Src:
	-$(RM) ./Demos/Drivers/Src/drv_timer.cyclo ./Demos/Drivers/Src/drv_timer.d ./Demos/Drivers/Src/drv_timer.o ./Demos/Drivers/Src/drv_timer.su

.PHONY: clean-Demos-2f-Drivers-2f-Src


################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Demos/App/Src/app.c 

OBJS += \
./Demos/App/Src/app.o 

C_DEPS += \
./Demos/App/Src/app.d 


# Each subdirectory must supply rules for building sources it contributes
Demos/App/Src/%.o Demos/App/Src/%.su Demos/App/Src/%.cyclo: ../Demos/App/Src/%.c Demos/App/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xC -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Demos/App/Inc -I../Demos/Drivers/Inc -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Demos-2f-App-2f-Src

clean-Demos-2f-App-2f-Src:
	-$(RM) ./Demos/App/Src/app.cyclo ./Demos/App/Src/app.d ./Demos/App/Src/app.o ./Demos/App/Src/app.su

.PHONY: clean-Demos-2f-App-2f-Src


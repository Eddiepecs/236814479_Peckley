@echo off 

:menu
echo Select a shape:
echo 1. Circle
echo 2. Triangle
echo 3. Quadrilateral
set /p shape=Input choice (1, 2, or 3):

if "%shape%"=="1" goto circle
if "%shape%"=="2" goto triangle
if "%shape%"=="3" goto quadrilateral
echo Invalid choice. Please select 1, 2, or 3.
goto menu

:circle
set /p radius= "Enter the radius:"
set /a area= %radius% * %radius% * 3.14
echo The area of the circle is %area%.
goto menu

:Triangle
set /p side1= "Enter the length of the 1st side:"
set /p side2= "Enter the length of the 2nd side:"
set /p side3=" Enter the length of the 3rd side:"
set /a s=(%side1% + %side2% + %side3%) / 2
set /a area=(%s% * (%s% - %side1%) * (%s% - %side2%) * (%s% - %side3%))
echo The area of the triangle is %area%:
    if %side1% EQU %side2% if %side2% EQU %side3% (
        echo The triangle is equilateral.
        
    ) 
        if %side1% NEQ %side2% if %side1% NEQ %side3% if %side2% NEQ %side3% (
            echo The triangle is scalene.
            
    )
    echo The triangle is Isosceles
    pause
goto menu

:quadrilateral
set /p length= "Enter the length of the quadrilateral:"
set /p width= "Enter the width of the quadrilateral:"
set /a area=length*width
echo The area of the quadrilateral is: %area%.
if %length%==%width% (
    echo The quadrilateral is a square.
) else (
    echo The quadrilateral is a rectangle.
)
goto menu

:end
pause
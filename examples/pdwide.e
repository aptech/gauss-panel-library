/*
** pdWide Example
**
** This example demonstrates the use of pdWide to transform 
** data from long panel data to a wide form panel 
**
*/
#include ../src/pdutil.src

/*
** First using dataset and formula specification
** to transform a single variable, investment.
** Note that we must also load the time variable (first)
** and the group indicator (second);
*/
y_wide1 = pdWide("grunfeld.dat", "year + firm + investment");

/*
** Next using dataset and formula specification
** to transform all the variables.**
** Note that we still must load the time variable first
** and the group indicator second.
*/
formula = "year + firm + investment + firm_value + capital";

y_wide2 = pdWide("grunfeld.dat", "year + firm + .");

/*
** Finally using a data matrix format to load variables. 
**
** We still must have the time variable first
** and the group variable second
*/
time_var = loadd("grunfeld.dat", "year");

id_var = loadd("grunfeld.dat", "firm");

yt = loadd("grunfeld.dat", "investment + firm_value + capital");

y_wide3 = pdWide(time_var~id_var~yt);

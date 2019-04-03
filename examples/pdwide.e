/*
** pdWide Example
**
** This example demonstrates the use of pdWide to transform 
** data from long panel data to a wide form panel 
**
*/
#include pdutil.src

/*
** First using dataset and formula specification
** to transform a single variable, investment.
** Note that we must also load the time variable (first)
** and the group indicator (second);
*/
y_wide1 = pdWide(__FILE_DIR $+ "grunfeld.dat", "year + firm + investment");

/*
** Next using dataset and formula specification
** to transform all the variables.**
** Note that we still must load the time variable first
** and the group indicator second.
*/
formula = "year + firm + investment + firm_value + capital";

y_wide2 = pdWide(__FILE_DIR $+ "grunfeld.dat", "year + firm + .");

/*
** Finally using a data matrix format to load variables. 
**
** We still must have the time variable first
** and the group variable second
*/
time_var = loadd(__FILE_DIR $+ "grunfeld.dat", "year");

id_var = loadd(__FILE_DIR $+ "grunfeld.dat", "firm");

yt = loadd(__FILE_DIR $+ "grunfeld.dat", "investment + firm_value + capital");

y_wide3 = pdWide(time_var~id_var~yt);

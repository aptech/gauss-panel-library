/*   Panel Example
**
**  The following is an example of a Gauss program for executing the
**  pooledOLS function.  This program provides estimates for the classic Grunfeld
**  dataset [grunfeld.dat].  These data were originally found in PhD
**  dissertation of Y. Grunfeld (University of Chicago, 1958). The data
**  is a balanced dataset covering 10 firms [firm = 1, ..., 10] for 20
**  years (1935-1950) [ year = 1935, ..., 1954].
**
**  The program follows 2.6.1 from 'Econometric Analysis of Panel Data',
**  Baltagi, 2005.
**
**  It estimates the model:
**      Investment_t = a + B_{1}Firm_value_t + B_{2}Capital_stock_t + u_t
**
**
*/

#include panel.sdf
#include panel.src

// Load grunfeld data
data = loadd(__FILE_DIR $+ "grunfeld.dat");

// Define variables
y = data[., 3];
x = data[., 4 5];
grp = data[., 1];

// Use robust SE

// Declare tscsmt output structure
struct panelEstimationOut outFE;

// Call FE
outFE = pooledOLS(y, x, grp, 0);


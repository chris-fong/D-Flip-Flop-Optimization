
.protect
.lib 'cic018.l' TT
.temp 25
.unprotect
.option
+ post
+ captab
+ ABSTOL=1e-7 RELTOL=1e-7 ACCURATE=1

.include 'DFF.spi'
* .SUBCKT DFF C D GND Q Qb VDD
xDFF C D VSS Q Qb VDD DFF

VDD VDD 0 1.8
VSS VSS 0 0
V1 C 0 PULSE(0 1.8 5n 0.1n 0.1n 1.666n 3.333n)

* ------------1(a)------------------
* rising
*.param delay_time = 15.0257n
*V2 D 0 PULSE(0 1.8 delay_time 0 0 100n 200n)
* .tran 0.01p 20n SWEEP delay_time 14.5n 15.5n 0.1n 
* obtained 15-15.1ns
*.tran 0.01p 20n SWEEP delay_time 15n 15.1n 10p
* obtained 15.02-15.03ns
*.tran 0.01p 20n SWEEP delay_time 15.02n 15.03n 1p
* obtained 15.025-15.026ns
*.tran 0.01p 20n SWEEP delay_time 15.025n 15.026n 0.1p
* obtained 15.0257ns

* falling
*.param falling_time = 14.9887n
*V2 D 0 PULSE(0 1.8 0 0 0 falling_time 40n)
*.tran 0.01p 20n SWEEP falling_time 14.5n 15.5n 0.1n
* obtained 14.9-15ns
* .tran 0.01p 20n SWEEP falling_time 14.9n 15n 10p
* obtained 14.98-14.99n
* .tran 0.01p 20n SWEEP falling_time 14.98n 14.99n 1p
* obtained 14.988-14.989n
* .tran 0.01p 20n SWEEP falling_time 14.988n 14.989n 0.1p
* obtained 14.9887ns

* ----------1(b)--------------
*rising
*.param delay_time = 15.0257n
*.param falling_time = 0.15n
*V2 D 0 PULSE(0 1.8 delay_time 0 0 falling_time 40n)
* .tran 0.01p 20n SWEEP falling_time 0.05n 0.25n 0.01n
*obtained 0.14n-0.15n
* .tran 0.01p 20n SWEEP falling_time 0.14n 0.15n 1p
*obtained 0.148n-0.149n
* .tran 0.01p 20n SWEEP falling_time 0.148n 0.149n 0.1p
*obtained 0.1482n

*falling
*.param falling_time = 14.9887n
*.param rising_time  = 15.1n
*V2 D 0 PULSE(0 1.8 0 0 0 falling_time rising_time)
* .tran 0.01p 20n SWEEP rising_time 15.0n 15.2n 0.01n
*15.08-15.09n
*.tran 0.01p 20n SWEEP rising_time 15.08n 15.09n 1p
*15.089-15.09n
*.tran 0.01p 20n SWEEP rising_time 15.089n 15.09n 0.1p
*obtained 15.0894n

* ----------1(c)-----------
*rising input
* V2 D 0 PULSE(0 1.8 10n 0 0 10n 20n)
* .tran 0.01p 25n

*falling input
V2 D 0 PULSE(0 1.8 0 0 0 10n 20n)
.tran 0.01p 25n
.end
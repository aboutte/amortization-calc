# amortization-calc

amortization-calc is a loan payment calculator and an amortization schedule printer written in Ruby.

## Instructions

```
1. Download and unzip
2. Open terminal and go to unzip directory
3. Run script with ruby command 'ruby amortization-calc.rb'
```

## Running in console

```
Write the annual interest rate percentage (e.g. 25): 30
Write the loan principal: 5000
Write the loan periods: 12
PAYMENT TYPE
	 1) Monthly  2) Biweekly  3) Weekly
	 Select a payment type: 3

LOAN INFORMATION
----------------------------------------------------------------------
Principal (loan amount): $5000.0
Annual interest rate percentage: 30.0%
Total interest to pay: $189.52
Total to pay: 5189.5199999999995

PAYMENTS PLAN
----------------------------------------------------------------------
12 weekly payments of $432.46

AMORTIZATION TABLE
----------------------------------------------------------------------
Period	 Payment	 Principal	 Interest	Balance
1	 432.46		 403.61		 28.85     	4596.39
2	 432.46		 405.94		 26.52	   	4190.45
3	 432.46		 408.28		 24.18	   	3782.17
4        432.46		 410.64		 21.82	   	3371.53
5	 432.46		 413.01		 19.45	   	2958.52
6        432.46		 415.39		 17.07	   	2543.13
7	 432.46		 417.79		 14.67	   	2125.34
8	 432.46		 420.2		 12.26	   	1705.14
9	 432.46		 422.62		 9.84		1282.52
10	 432.46		 425.06		 7.4		857.46
11	 432.46		 427.51		 4.95		429.95
12	 432.46		 429.98		 2.48		0
```
## Versioning

We use [SemVer](http://semver.org/) for versioning.

## Authors

* **Jesús Francisco Rodríguez Pérez** - *As a Ruby Developer* - [tolesco](https://github.com/tolesco)

See also the list of [contributors](https://github.com/tolesco/amortization-calc/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

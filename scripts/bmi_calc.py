from __future__ import division

def BMI(height, weight):
	height = height / 100
	bmi = (weight / (height * height))
	return round(bmi,2)
	
def h_status(bmi):	
	if bmi < 18.50:  
		return 'underweight'
	elif bmi >= 18.50 and bmi <= 24.99:
		return 'normal'
	elif bmi > 24.99:
		return 'overweight'

def change_perc(c_bmi, p_bmi):
	perc = (c_bmi - p_bmi) / p_bmi
	return round(perc,2)

def bracket(age):
	if age < 20:  
		return 'teen'
	elif age >= 20 and age <= 29:
		return 'young_adult'
	elif age > 29:
		return 'adult'
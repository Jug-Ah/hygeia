create table fitnessplan(
  gender text,
  ageBracket text,
  healthStatus text,
  exercisePlan text,
  dietPlan text,
  constraint fitnessPlanPk primary key(gender, ageBracket, healthStatus)
);

-- shortcuts used on plans
-- 1=male, 2=female
-- a=teen, b=young_adult, c=adult
-- x=underweight, y=normal, z=overweight

insert into fitnessplan(gender, ageBracket, healthStatus, exercisePlan, dietPlan)
   values ('male', 'teen', 'underweight',
   'Do any of the following exercises at least 3 times a week | Running 60 minutes | Swimming 60 minutes | Cycling 60 minutes | Push-ups 60 minutes | Sit-ups 60 minutes | Running 60 minutes',
   'At least once a day, 7 times a week | Fat-free or low-fat milk - 24 ounces | Meats/proteins - 5 ounces | Fruits - 1.5 cups | Vegetables - 2.5 cups | Grains - at least 6 ounces | Fiber - 31 grams'),
   ('male', 'teen', 'normal',
   'Do any of the following exercises everyday | Lift-off Lunge 60 minutes | Pushup and Leg Raise 60 minutes | Crossover Crunch 60 minutes | Squat and Overhead Press 60 minutes | Stacked Pushup 60 minutes',
   'At least once a day, 7 times a week | Starch - rice, tapioca, potatoes | Protein - egg Whites, beans, pulses, peas | Green veggies – 3cups'),
   ('male', 'teen', 'overweight',
   'Do any of the following exercises at least 4 times a week | Ball Workouts 30 minutes | Aqua Aerobics 30 minutes | Walk 60 minutes',
   'At least once a day, 7 times a week | Grains | Dark green veggies | Lean meats and poultry without skin | Fish | Oily fish containing omega-3 fatty acids '),
   ('female', 'teen', 'underweight',
   'Do any of the following exercises at least 3 times a week | Running 60 minutes | Sit-ups 60 minutes | Dancing 60 minutes | Running 60 minutes | Walking 60 minutes | Cycling 60 minutes',
   'At least once a day, 7 times a week | Fat-free or low-fat milk - 24 ounces | Meats/proteins - 5 ounces | Fruits - 1.5 cups | Vegetables - 2 cups |Grains - at least 5 ounces | Fiber - 26 grams'),
   ('female', 'teen', 'normal',
   'Do any of the following exercises everyday | Lift-off Lunge 60 minutes | Scissors Jump 60 minutes | Push-ups  60 minutes | Leg Raise 60 minutes | Boat Curl and Press 60 minutes| Triangle Lat Raise 60 minutes | Dip and Knee Raise 60 minutes',
   'At least once a day, 7 times a week | Drink plenty of water | Carbs | Pasta | Sweet potato | Wholegrain bread | Saturated fat'),
   ('female', 'teen', 'overweight',
   'Do any of the following exercises at least 4 times a week | Running	30 minutes | Walking 30 minutes | Hip Flexor Stretch 30 minutes | Double Hip Extension 30 minutes | Standing Chest Stretch 30 minutes | Floor I-Position Raise 30 minutes',
   'At least once a day, 7 times a week | Vegetables | Whole grains | Fat-free or low-fat milk | Protein foods'),
   ('male', 'young_adult', 'underweight',
   'Do any of the following exercises at least 3 times a week | Squat 30 minutes | Bench Press 30 minutes | Stiff Leg Deadlift 30 minutes | Seated Overhead Barbell Press 30 minutes | Bent Over Row 30 minutes | Skullcrushers	30 minutes | Pull Ups/Lat Pull Down 30 minutes | Dumbbell Curl 30 minutes',
   'At least once a day, 7 times a week | Grains - 7 ounces | Vegetables - 3 cups | Dark green veggies - 2 cups | Red and orange veggies - 6 cups | Beans and peas - 2 cups | Starchy veggies - 6 cups | Fruits - 2 cups | Dairy - 3 cups | Protein - 6 ounces'),
   ('male', 'young_adult', 'normal',
   'Do any of the following exercises at least 3 times a week | Box jumps - 30 minutes | Walking lunges with heavy sandbag - 30 minutes | Towel pull ups - 30 minutes | AMAP Kettlebell swings - 30 minutes | Bear crawl - 30 minutes | Yards Keg clean and press - 30 minutes',
   'At least once a day, 7 times a week | Whole grains | Dark green veggies | Red and orange veggies | Beans and  peas | Starchy veggies'),
   ('male', 'young_adult', 'overweight',
   'Do any of the following exercises at least 4 times a week | Incline Bench Press 30 minutes | Seated Triceps Press 30 minutes | Triceps Pushdown 30 minutes | Leg Press 30 minutes | Leg Extensions 30 minutes | Hamstring Curls 30 minutes | Seated Calf Raises 30 minutes | Standing Calf Raises 30 minutes',
   'At least once a day, 7 times a week | Carbohydrates | Grains | Milk | Beef | Egg |Oysters'),
   ('female', 'young_adult', 'underweight', 
   'Do any of the following exercises at least 3 times a week | Squats 60 minutes | Pull-ups 60 minutes | Rows 60 minutes | Push-ups 60 minutes | Leg Curl 30 minutes | Calf Raise 30 minutes | Sit Ups	30 minutes',
   'At least once a day, 7 times a week | Fat-free or low fat milk - 24 ounces | Meats/proteins - 5 ounces | Fruits - 1.5 cups | Vegetables - 2.5 cups | Grains - at least 6 ounces | Fiber - 29 grams'),
   ('female', 'young_adult', 'normal',
   'Do any of the following exercises at least 4 times a week | Plank with Alternating Leg Lift	30 minutes | Wood Chop with Resistance Band	30 minutes | Squat and Overhead Press 30 minutes | Romanian Deadlift 30 minutes | Bent-Over Row 30 minutes | Dynamic Lunge 30 minutes | Jump Squat 30 minutes',
   'At least once a day, 7 times a week | Grains whole grains | Protein - 3 cups | Milk/ yogurt/fortiﬁed soy beverage - 1 cup | Natural cheese - 1.5 ounces | Raw or cooked fruit/ cup dried fruit - 1 cup | Meat, poultry, or seafood | 1 egg | Cooked beans or peas'),
   ('female', 'young_adult', 'overweight',
   'Do any of the following exercises at least 4 times a week | Running	30 minutes | Walking 30 minutes | Pushup and Leg Raise 30 minutes | Crossover Crunch 30 minutes',
   'At least once a day, 7 times a week | Beef or chicken liver | Clams, mollusks, or mussels | Vegetable and fruit | Grain foods'),
   ('male', 'adult', 'underweight',
   'Do any of the following exercises at least 4 times a week | Stretching 10 minutes | Hiking 30 minutes | Swimming 20 minutes | Weight Lifting',
   'At least once a day, 7 times a week | Fruits - 2 cups | Dairy - 3 cups | Protein - 6 ounces | Drink fat-free or low-fat - 1 glass | Dark Green Vegetables - 2 cups | Orange Vegetables - 6 cups | Dry Beans and Peas - 2 cups | Starchy Vegetables - 6 cups | Other Vegetables - 5 cups'),
   ('male', 'adult', 'normal',
   'Do any of the following exercises at least 4 times a week | Tai Chi Lunge 30 minutes | Side Plank with Moving Knee 30 minutes | Push-up and Leg Raise 30 minutes | Crossover Crunch	30 minutes | Squat and Overhead Press 30 minutes | Plyo Plank 30 minutes',
   'At least once a day, 7 times a week | Grains | Dark green veggies | Red and orange veggies | Beans and peas | Starchy veggies | Other veggies | Fruits | Protein'),
   ('female', 'adult', 'overweight',
   'Do any of the following exercises at least 4 times a week | Hip Flexor Stretch 30 minutes | Double Hip Extension 30 minutes | Standing Chest Stretch 30 minutes  | Floor I-Position Raise 30 minutes',
   'At least once a day, 7 times a week | Dark-green and red and orange vegetables | Whole grains | Low-fat milk | Seafood | Lean meat and poultry, eggs | Dietary fiber | Fortified cereals | Dietary supplements'),
   ('female', 'adult', 'underweight',
   'Do any of the following exercises everyday | Yoga 60 minutes | Dance 60 minutes | Running 60 minutes | Walking 60 minutes | Cycling 60 minutes | Household chores 60 minutes',
   'At least once a day, 7 times a week |Fat-free or low fat milk - 24 ounces | Meats/proteins - 5 ounces | Fruits - 1.5 cups | Vegetables - 2.5 cups | Grains - at least 6 ounces | Fiber - 29 grams '),
   ('female', 'adult', 'normal',
   'Do any of the following exercises at least 4 times a week | Hip Flexor Stretch 30 minutes | Double Hip Extension 30 minutes | Standing Chest Stretch 30 minutes | Floor I-Position Raise 30 minutes',
   'At least once a day, 7 times a week | Vegetables | Dairy | Milk | Yogurt | Cheese | Calcium-fortiﬁed soy products | Protein | Seafood'),
   ('male', 'adult', 'overweight',
   'Do any of the following exercises at least 4 times a week | Light swimming 10 minutes | Walking 60 minutes | Light jogging on treadmill	Machines 50 minutes',
   'At least once a day, 7 times a week | Fat-free and low-fat dairy products | Protein foods | Whole-grain foods | Fruits');

  
create or replace function get_fitnessplan_bykey(in text, in text, in text, out text, out text)
    returns setof record as
$$
       select exercisePlan, dietPlan from fitnessplan
       where gender = $1 and ageBracket = $2 and healthStatus = $3;
$$
   language 'sql';
   
create or replace function get_exerciseplan_bykey(in text, in text, in text, out text)
    returns setof text as
$$
       select exercisePlan from fitnessplan
       where gender = $1 and ageBracket = $2 and healthStatus = $3;
$$
   language 'sql';

create or replace function get_dietplan_bykey(in text, in text, in text, out text)
    returns setof text as
$$
       select dietPlan from fitnessplan
       where gender = $1 and ageBracket = $2 and healthStatus = $3;
$$
   language 'sql';
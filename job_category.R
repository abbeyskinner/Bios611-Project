library(tidyverse)
library(survivoR)

# Create a function to categorize professions
categorize_profession <- function(profession) {
  # Use a case_when to assign each profession to a category
  category <- dplyr::case_when(
    profession %in% c("Doctor", "Nurse", "Physician", "Nurse Practitioner", "Medical Student", "Phlebotomist",
                      "Pharmacist", "Clinical Psychologist", "Pediatric Nurse", "Anesthesiologist", "Plastic Surgeon",
                      "Urologist", "ER Doctor", "Surgeon", "Nursing Student", "Medical Assistant", 
                      "Dental Student", "Pharmacy Technician", "Neurologist", "Personal Nurse", 
                      "Dentist", "Mortician", "Nursing Practitioner", "Retired Nurse", "EMT/Pro Cheerleader",
                      "Physician/Army Orthopedic Surgery Resident", "Physical Therapist", "Neurosurgeon",
                      "Healthcare Worker", "Therapist", "Heart Valve Specialist", "Biochemist", "Chemical Disposal",
                      "Chemist", "Surgical Podiatrist", "Critical Care Nurse") 
    ~ "Healthcare & Science",
    
    profession %in% c("Real Estate Developer", "Real Estate Agent", "Real Estate Salesman", "Real State Agent",
                      "Real Estate Broker", "Real Estate Manager", "Property Developer", "Real Estate",
                      "Land Broker", "Residential Builder", "Real Estate Executive", "Realtor", 
                      "Real Estate Agent/Stay-at-home Dad") 
    ~ "Real Estate",
    
    profession %in% c("College Student", "Graduate Student", "PhD Student", "High School Student", "Student/Athlete",
                      "Economics Student", "Student", "Ivy League Student", "Seminary Student", "Business Student",
                      "Political Science PhD", "Ivy League Graduate", "Pre-Med Student", "Model/Student", 
                      "Full-Time Student/Sales", "Crossfit Coach/Physical Therapy Student", "Grad Student") 
    ~ "Student",
    
    profession %in% c("Teacher", "Professor", "Principal", "College Administrator", "Admissions Counselor", 
                      "Academic Intern", "High School Teacher", "Elementary Teacher", "English Teacher", 
                      "P.E. Teacher", "Yoga Instructor/Math Professor", "School Principal", "Gym Teacher", 
                      "English Professor", "Art Teacher", "Student Teacher", "College Admissions Director", 
                      "Education Project Manager", "School Lunch Lady", "4th Grade Teacher", "Bookkeeper",
                      "Physical Education Teacher", "Retired Teacher", "Guidance Counselor", "Physics Teacher",
                      "English Profressor", "Special Education Teacher", "English professor", "Music Teacher", 
                      "Research Coordinator", "Elementary School Teacher", "Special Ed Teacher", "Science Teacher") 
    ~ "Education & Academia",
    
    profession %in% c("Sales Manager", "Marketing Director", "Advertising Executive", "Retail Salesperson", 
                      "Internet Projects Manager", "Sales Executive", "Marketing Executive", "Freelance Marketer",
                      "Digital Content Creator", "Account Manager", "Sales & Marketing Associate",
                      "Marketing Manager", "Advertising Salesman", "Sales Representative", "Elevator Salesman",
                      "Communications Manager", "Management Consultant", "Marketing Manager", "Used Car Salesman",
                      "Retail Saleswoman", "Financial Salesman", "Shoe Salesman", "Copier Sales Executive", 
                      "Spa Saleswoman", "Saleswoman", "Insurance Saleswoman", "BMX Bike Salesman", "Software Sales",
                      "Traveling Sales Representative", "Social Media Marketer", "Vacation Club Saleswoman", 
                      "Vacation Club Sales", "Graphic Saleswoman", "Social Media Strategist", "Tech Sales",
                      "Advertising Account Executive", "Publishing CEO", "District Sales Manager", 
                      "Director of Marketing & Communications", "Cyber Security Saleswoman", 
                      "Jewelry Salesman/Photographer", "Social Media Manager", "Pharmaceutical Saleswoman", 
                      "Pharmaceutical Sales Representative", "Pharmaceutical Sales", "Medical Saleswoman", 
                      "Medical Marijuana Dispenser", "Healthcare Consultant", "Medical Sales Representative",
                      "Pharmaceutical Representative", "Media Buyer", "Slot Machine Salesman", "Marketing Strategist") 
    ~ "Sales & Marketing",
    
    profession %in% c("Actor", "Actress", "Musician", "Singer", "Artist", "Writer", "Comedian", "Broadcaster", 
                      "Media Consultant", "Photographer", "Television Writer", "Creative Director", 
                      "Musician/Retired Teacher", "Singer/Songwriter", "Aspiring Actress", "Art Consultant",
                      "Freelance Writer", "Vegas Showgirl", "Singer/Entertainer", "Fire Dancer", "Jazz Musician",
                      "Heavy Metal Musician", "Former Model", "Aspiring Writer", "Music Producer", "Wedding Videographer",
                      "Former Pop Star", "Art Student", "Visual Effects Producer", "Spoken Word Artist",
                      "Country Music Singer", "Stand-Up Comedian", "Former TV Teen Star", "Entertainment Host and Writer",
                      "Comic Book Artist", "Singer/Actor/Writer", "Broadway Performer/Model/Aerialist",
                      "Ex-Talent Agent Assistant", "YouTube Sensation", "Entertainment Host/Writer", "Filmmaker", 
                      "Multimedia Artist", "Morning News Anchor", "Talent Manager", "Christian Radio Host", 
                      "Host/Keynote Speaker", "Content Producer")
    ~ "Arts, Entertainment & Media",
    
    profession %in% c("Model", "Swimsuit Model", "Pin-Up Model", "Fashion Director", "Footwear Designer",
                      "Cosmetology Student", "Jewelry Designer", "Fashion Stylist", "Massage Therapist",
                      "Makeup Artist", "Hairstylist", "Nail Salon Manager", "Hairdresser","Pageant Coach",
                      "Aspiring Designer", "T-shirt Designer", "Swimsuit Photographer", "Cosmetologist", "Designer",
                      "Former Miss Delaware", "Male Model", "Miss Kentucky Teen USA", "Furniture Designer",
                      "Interior Designer", "Model/Spray Tan Business Owner","Sideline Chic Owner", "Bridal Shop Owner",
                      "Jeweler", "Barbershop Owner", "Salon Owner") 
    ~ "Fashion & Beauty",
    
    profession %in% c("Business Consultant", "Executive Recruiter", "Corporate Trainer", "Product Manager", 
                      "Financial Consultant","Business Development Manager","CEO", "MBA Student", "Financial Assistant",
                      "Investment Banker", "Actuary", "Tax Accountant", "Loan Officer", "Health Club Consultant",
                      "Administrative Assistant", "Behavior Analyst", "Office Manager", "Construction Company Vice President", 
                      "Office Assistant", "Equity Trade Manager", "Document Manager", "Risk Consultant", 
                      "Corporate Consultant", "Office Manager", "Banker", "Administrative Officer", "Accountant", 
                      "Corporate Executive", "Asset Manager", "Insurance Adjuster", "Business Analyst", "Case Manager",
                      "Product Management", "Educational Project Manager", "Project Manager", "Equity Research Assistant",
                      "Business Owner", "Entrepreneur", "Small Business Owner", "Franchise Owner", "Hedge Fund Support",
                      "Insurance Agent", "Investment Analyst", "Program Coordinator") 
    ~ "Finance & Business Management",
    
    profession %in% c("Lawyer", "District Attorney", "Defense Attorney", "Attorney", "Paralegal", "Judge", 
                      "Trial Attorney", "Civil Rights Attorney", "Legal Secretary", "Public Defender", 
                      "Probation Officer", "Corporate Lawyer", "Law Student", "Law School Student", "Pre-Law Student", 
                      "Law Clerk", "Crime Reporter", "Deputy District Attorney", "Expert Witness Locator", 
                      "Harvard Law Student", "Attorney/Retired NFL Player", "Assistant District Attorney", 
                      "Law Student/Former Military", "Divorce Attorney", "Personal Injury Attorney", 
                      "Attorney/Former NFL Player", "Estate Attorney") 
    ~ "Legal",
    
    profession %in% c("Electrician", "Plumber", "Carpenter", "Mechanic", "Technical Writer", 
                      "Welder", "HVAC Technician", "Construction Worker", "Telephone Technician", "Truck Assembler",
                      "Highway Repair Worker", "Highway Construction Worker", "Steelworker", "Maintenance Man",
                      "Oil Tanker Crewman", "Motorcycle Repairwoman", "Tire Repairman", "General Contractor", 
                      "Oil Driller", "Contractor", "Boat Mechanic", "Construction Supervisor", "Maintenance Manager", 
                      "Factory Worker", "Warehouse Associate", "Auto Customizer", "Lumberjill", 
                      "Water Treatment Technician", "Oil Company Owner", "Pest Control Company Owner") 
    ~ "Skilled Trades & Technical",
    
    profession %in% c("Police Officer", "FBI Agent", "Security Officer", "Retired Navy Seal", "Army Veteran", 
                      "Sheriff", "Corrections Officer", "Navy Seal", "Marine", "SWAT Officer", "Firefighter", 
                      "Detective", "Retired NAVY Seal", "Army Intelligence Officer", "Retired Police Officer",
                      "Ex-Navy Fighter Pilot", "Drill Sergeant", "Retired Fire Captain", "Police Sergeant",
                      "U.S. Army Sergeant", "Iraq War Veteran", "Former Federal Agent?", "Retired NYPD Detective",
                      "Retired LAPD Officer", "Fireman/EMT", "State Trooper", "Former FBI Agent", "S.W.A.T. Officer", 
                      "Air Force Veteran", "Retired Firefighter", "Security Specialist") 
    ~ "Law Enforcement & Military",
    
    profession %in% c("Personal Trainer", "Fitness Instructor", "CrossFit Coach", "Triathlon Coach", 
                      "Professional Athlete", "NFL/NHL Player", "Gym Owner", "Sports Coach", "Yoga Instructor", 
                      "YMCA Basketball Coach", "Ex-NFL Player", "Former Pro Cyclist", "Olympian", "Paralympian",
                      "Competitive Cyclist", "Professional Soccer Player", "Former Professional Athlete", 
                      "Yoga Instructor", "Basketball Coach", "Navy Swim Instructor", "Health and Fitness Reporter",
                      "Water Skiing Instructor", "Former NFL Quarterback", "Sports Radio Host", "Professional Wrestler",
                      "Profession Volleyball Player", "Boxer", "Cheerleading Coach", "Surfing Instructor",
                      "Gymnastics Coach", "Olympic Gold Medalist", "Professional Cyclist", "Soccer Coach/Musician",
                      "Former Professional Cyclist", "Former NFL Coach", "Swim Coach", "Professional Dancer", 
                      "Dance Team Manager", "Lingerie Football Player", "Baseball/Dating Coach", "Former MLB Player", 
                      "Track Coach", "Former Pro Cyclist/Shop Manager", "Former NBA All-Star", "Ex-NFL Cheerleader",
                      "Pilates Teacher", "Martial Arts Instructor", "Crossfit Coach/Project Coordinator", 
                      "Sailing Instructor", "Former NBA Player", "Bodybuilder", "Dietitian", "Snowboard Instructor",
                      "NFL Player", "Lifeguard", "Mixed Martial Arts Fighter", "Former NHL Player", "Olympic Medalist",
                      "Chief Lifeguard", "CrossFit Trainer", "Fitness Consultant", "Roller Girl", "Surf Instructor",
                      "Competitive Cheerleading Gym Owner", "Miami Marlins President", "Yogi", "College Coach") 
    ~ "Sports & Fitness",
    
    profession %in% c("Social Worker", "Youth Pastor", "Youth Mentor", "Mentor", "Life Coach", "Volunteer",
                      "Mail Carrier", "Career Counselor", "Pastor", "Troubled Teens Mentor", "Motivational Speaker",
                      "Housing Case Manager", "Non-Profit Fundraiser", "Charity Organizer", "Professional Speaker",
                      "Postal Worker", "Homeless Shelter Manager", "YMCA Program Director", "Career Consultant",
                      "Keynote Speaker/Social Entrepreneur", "Life Coach/Speaker/Yoga Teacher", "Missionary Recruiter",
                      "Charity Projects Manager", "Drug Counselor", "Parent Coach")
    
    ~ "Community & Social Services",
    
    profession %in% c("Chef", "Bartender", "Waiter", "Restaurant Owner", "Hotel Doorman", "Caterer", 
                      "Food Service Worker", "Sushi Chef", "Fast Food Franchisee", "Cocktail Waitress",
                      "Cook", "Food Truck Operator", "Restaurant Manager", "Barista", "Waitress", "Coffee Barista", 
                      "Waitress/Bartender", "Personal Chef", "Flight Attendant", "Restaurant Designer", 
                      "Cocktail Waitress/Graphic Designer", "Bellhop", "Kitchen Staff Member", "Bar Manager",
                      "Club Promoter", "Airline Agent", "Customer Service Representative", "Grocery Clerk", 
                      "Ice Cream Entrepreneur", "Ice Cream Scooper", "Merchandiser", "Produce Clerk", "Retail Buyer") 
    ~ "Food, Hospitality, & Retail",
    
    profession %in% c("Farmer", "Rancher", "Fisherman", "Gardener", "Beekeeper", "Wilderness Guide", 
                      "Hunting Guide", "Conservationist", "Park Ranger", "Commercial Fisherman", "Dairy Farmer",
                      "River Rafting Guide", "Teacher/Farmer", "Goat Farmer", "Nature Guide", "Fishing Boat Captain",
                      "Children's Adventure Guide", "Scoutmaster", "Sheep Farmer", "Chicken Farmer", "Hiking Guide",
                      "Cattle Rancher", "Goat Rancher", "Post Office Manager/Farmer", "River Guide", 
                      "Wilderness Therapy Guide", "Fisherwoman", "Fishing Guide", "Fishmonnger", "Dolphin Trainer",
                      "Zookeeper", "Dog Trainer","Horse Trainer", "Marine Animal Trainer", "Veterinarian", "Pet Cremator",
                      "Paddleboard Company Owner", "Beach Service Company Owner", "Barrel Racer", "Bounty Hunter") 
    
    ~ "Agriculture, Outdoors, & Animal Care",
    
    profession %in% c("Software Developer", "Engineer", "Technology Executive", "IT Manager", "Cybersecurity Analyst", 
                      "App Developer", "Internet Projects Manager", "UX Designer", "Robotics Scientist",
                      "Data Scientist", "Cyber Security Analyst", "Software Publisher", "Rocket Scientist",
                      "Computer Projects Coordinator", "Computer Programmer", "Missile Engineer", "Web Producer",
                      "Internet Technology Director", "Computer Engineer", "Engineer Graduate/Model", "Nuclear Engineer",
                      "Yahoo! Executive", "Quantitative Strategist", "Internet Project Manager", "Industrial Engineer",
                      "Tech Investor", "Security Software Engineer", "NASA Engineering Student", "Engineering Manager",
                      "Aerospace Tech", "Software Engineer", "IT Quality Analyst", "Data Analyst") 
    ~ "Technology & Engineering",
    
    
    # If it doesn’t fit into any category above, categorize as "Other"
    TRUE ~ "Other"
  )
  
  return(category)
}

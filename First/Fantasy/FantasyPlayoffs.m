% This program is intended to list all possible playoff scenarios for a league based on the remaining schedule


% Step 1: Define the current league dynamics

Teams = {"40-40", 
		 "GuessNiners",
		 "The Scrub Club",
		 "Iron Weasel",
		 "The Babboons",
		 "Lost Team",
		 "Show me your TDs",
		 "Da Hood Dwellers",
		 "The Project",
		 "Fort Apache",
		 "Griffins",
		 "Seany Drama"};

% Records = [Wins Loses TotalPoints]
Records = [5 6  1131.68; 
           0 11  665.84;
		   6 5  1037.24;
		   3 8   922.98;
		   7 4   990.26;
		   6 5   981.50;
		   7 4  1150.10;
		   8 3   980.90;
		   4 7   800.56;
		   7 4  1199.70;
		   6 5  1067.76;
		   7 4   927.94;];		
		   
% Schedule = [HomeTeamIndex RoadTeamIndex]		   
 
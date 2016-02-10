% Function that determines the probability of one team catching another team in a playoff race

% In this case, we'll explore the Nationals chance to catch the Red

function y = Pl(GamesPerSeries, TeamWinPer, NumSeries) 
    GameResults = rand(NumSeries, GamesPerSeries) < TeamWinPer;

    % Get results
    WinsRequired = round(GamesPerSeries/2);
    SeriesResults = sum(GameResults, 2) >= WinsRequired;
    NumSeriesWins = sum(SeriesResults);

    % Determine Series Win Probability
    y = NumSeriesWins/NumSeries;
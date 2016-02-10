


% Function that generates a series win prob
function y = SeriesWinProb(GamesPerSeries, TeamWinPer, NumSeries) 
    GameResults = rand(NumSeries, GamesPerSeries) < TeamWinPer;

    % Get results
    WinsRequired = round(GamesPerSeries/2);
    SeriesResults = sum(GameResults, 2) >= WinsRequired;
    NumSeriesWins = sum(SeriesResults);

    % Determine Series Win Probability
    y = NumSeriesWins/NumSeries;









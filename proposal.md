# Predicting Success in the NFL Based on Draft Combine Results

## Team

### Marcus
Email: mmann01@syr.edu  
GitHub ID: marcusmann19

### Jordan
Email: jghemley@syr.edu  
GitHub ID: Jemley23

### Brady
Email: 

GitHub ID:

### Jake Sciamanna (Point of Contact)
Email: jpsciama@syr.edu  
GitHub ID: JSciamanna17

Repository: https://github.com/JSciamanna17/IST-707-Final-Project-JS-JH-BW-MM

## Introduction

Every February, hundreds of college football players run, jump, and lift in front of NFL teams at the Scouting Combine, shaping decisions worth millions of dollars. This project asks how well those results actually predict success in the NFL. We will look at whether certain drills matter for certain position groups. For example, a sprint time may reveal a great deal about a cornerback and very little about an offensive lineman. We also want to determine whether Combine performance works more as a benchmark a player must hit or as a ranking where being better continues to increase the chance of NFL success.

What is different about our approach is that we will focus on players within their own position groups instead of assuming that the same Combine drills matter equally for everyone. We will also focus on actual NFL career success rather than simply predicting where a player will be drafted.

Our best-case result would be finding that certain Combine drills are better at predicting NFL success for certain positions. Ideally, we will be able to show which drills matter most for each position and which ones do not. This could help NFL teams better understand how much value they should place on different Combine results when evaluating players.

## Literature Review

Previous research has questioned how well the NFL Combine predicts future NFL performance. Kuzmits and Adams studied quarterbacks, running backs, and wide receivers and found that most Combine drills did not have a strong relationship with future NFL performance, although sprint testing showed some usefulness for running backs.[^1] Robbins studied 1,155 drafted players across 17 positions and similarly found that most Combine tests had a limited relationship with draft position, although speed and jumping tests appeared more useful than some other drills.[^2]

There is evidence that the usefulness of a drill depends on position. Teramoto, Cross, and Willick found that sprint performance was related to future rushing performance for running backs, while height and vertical jump were more useful for wide receivers.[^3] Another study found that Combine measurements explained only a small amount of future NFL game performance.[^4] A 2023 review of 68 previous studies also found mixed evidence about the Combine's ability to predict future success.[^5]

More recently, Doyle et al. studied 3,681 Combine participants and found that Combine testing alone was a poor predictor of draft outcomes, but they also found clear physical differences between positions.[^6] Machine learning has also been used for this problem. Szekely et al. tested six machine-learning models and had some success predicting whether a Combine participant would eventually play in the NFL, but predicting long-term career success was more difficult.[^7] Our project will build on this research by examining which Combine measurements are useful within specific positions and whether they can help predict actual NFL career success.

### Stakeholder Needs

Our main stakeholders are NFL general managers and front offices because they make draft decisions and decide where teams spend draft picks and money. They need to know which Combine information is actually useful when evaluating a player. Our project could show which tests deserve more attention for each position and which may not provide much information about future NFL success.

NFL scouts and analytics departments are also stakeholders because Combine results are one part of a larger evaluation process that includes film, college production, interviews, and medical information. They need to understand what the Combine adds to that process and whether different standards should be used for different positions.

NFL owners and executives are stakeholders because draft picks can become major financial and roster investments. Players, agents, and trainers could also use the results because players spend significant time preparing for the Combine and would benefit from knowing which drills seem most important for their position.

Overall, our stakeholders share one main question: Which parts of the NFL Combine actually tell us something useful about how a player will perform in the NFL, and does that change depending on position?

## Data and Methods

### Data

For our project, we plan to use two main datasets from nflverse through the `nflreadr` package in R. The first dataset contains NFL Scouting Combine results and the second contains NFL Draft and career performance data. Both datasets can be loaded directly into R, which will allow us to clean, combine, explore, and model the data within the same program.

Our first dataset is the nflverse NFL Scouting Combine dataset:

https://nflreadr.nflverse.com/reference/load_combine.html

The dataset can be loaded directly into R using `load_combine()`. The Combine dataset currently contains 8,968 rows and 18 columns, with data going back to 2000. Each row represents a player who participated in the NFL Combine. Features include player name, position, school, height, weight, 40-yard dash time, bench press reps, vertical jump, broad jump, three-cone drill, shuttle time, and draft information.

Our second dataset is the nflverse NFL Draft Picks dataset:

https://nflreadr.nflverse.com/reference/load_draft_picks.html

This dataset can be loaded directly into R using `load_draft_picks()`. It currently contains 12,927 rows and 36 columns and includes NFL draft picks dating back to 1980. It contains career measurements such as games played, seasons started, Pro Bowls, All-Pro selections, Career Approximate Value, and Weighted Approximate Value. It also contains position-specific statistics such as passing yards, rushing yards, receiving yards, touchdowns, tackles, sacks, and interceptions.

One of the most useful parts of these datasets is that they both contain Pro Football Reference player IDs. We can use these IDs in R to join players from the Combine dataset with their NFL career information in the Draft Picks dataset. This should be more reliable than trying to match thousands of players using only their names.

Our main measurement of NFL success will likely be Career Approximate Value, or Career AV. This gives us one measurement of a player's career value that can be used across different positions. We can also look at other measurements such as games played, seasons started, Pro Bowls, and All-Pro selections to see if our results remain similar when success is measured differently.

We believe these datasets are reliable because nflverse provides documentation and data dictionaries explaining the variables and identifies Pro Football Reference as the source of both datasets. Having both datasets available through the same `nflreadr` package should also make it easier to combine the data in R and understand what each variable represents.

### Methods

We plan to complete our data preparation, analysis, and modeling in R. Our first step will be exploring the data to understand the Combine measurements and how they change depending on position. We will look at missing values, outliers, correlations, and the relationships between individual Combine drills and future NFL performance. It will be especially important to separate players by position because a good Combine result for one position may be completely different for another.

Before creating our models, we will clean and combine the two datasets in R. We will use the Pro Football Reference player IDs to connect Combine participants with their NFL career results. We will also have to deal with players who skipped certain Combine drills and therefore have missing values. Numerical variables may need to be standardized depending on the model we use. We may also create variables showing how a player ranked in a Combine drill compared with other players at the same position.

We plan to start with simpler models so that we have a baseline to compare our results against. For predicting a continuous measurement such as Career AV, we can start with linear regression. We can then compare its performance with machine-learning models such as Random Forest and Gradient Boosting.

We may also turn NFL success into a classification problem. For example, we could classify whether a player became a successful NFL starter or long-term contributor. If we use this approach, we could compare logistic regression with tree-based classification models. This gives us another way of looking at the question instead of depending completely on one definition of NFL success.

An important part of our project will be running these analyses by position. We want to determine whether different Combine drills matter more for certain positions and whether there are certain benchmarks that successful players tend to reach. We can use model coefficients and feature importance to determine which Combine measurements have the strongest relationship with future NFL success.

To evaluate the models, we will separate training data from testing data and use cross-validation during model development. For regression models, we can use RMSE and R-squared to determine how close our predictions are to actual career results. If we use classification models, we can evaluate them using precision, recall, F1 score, and ROC AUC instead of relying only on accuracy.

Our ideal final result will show how well Combine results can predict NFL success and which Combine drills are most useful for each position. This connects directly to our stakeholder needs because NFL teams would not only see how accurate the models are, but also which Combine measurements appear to provide the most useful information.

## Project Plan

We have roughly two months to complete the project before the final report is due during the first week of December. We will divide the project into smaller stages so that progress and GitHub contributions are made throughout the semester.

| Period | Activity | Milestone |
| --- | --- | --- |
| Sept. 21 - Oct. 4 | Load datasets in R, review variables, examine missing data, and begin EDA. | Data loaded and initial EDA completed. |
| Oct. 5 - Oct. 18 | Clean and merge Combine and NFL career data. Determine positions and variables to include. | Final modeling dataset created. |
| Oct. 19 - Nov. 1 | Create position-specific features and build baseline models. | Baseline models and initial results completed. |
| Nov. 2 - Nov. 15 | Train Random Forest, Gradient Boosting, and other candidate models. Perform cross-validation and tuning. | Candidate models compared. |
| Nov. 16 - Nov. 22 | Evaluate final models and compare feature importance and results across positions. | Final modeling results completed. |
| Nov. 23 - Nov. 29 | Create visualizations, interpret results, and write the final report. | First complete version of final project. |
| Nov. 30 - First Week of Dec. | Review code and results, make final edits, and prepare final submission. | Final project completed and submitted. |

All team members will make meaningful contributions to the GitHub repository throughout the project so that our commit history shows steady and distributed progress.

## Risks

There are several risks that come with using NFL Combine data. First, the Combine is invite only, meaning some players who eventually make NFL teams will not have Combine results. Players may also skip certain drills or perform while injured, sick, or nervous, meaning one day of testing may not perfectly represent their physical ability.

Another major limitation is that Combine drills are not actual football games. A player can have great physical measurements and still struggle in the NFL. Measurements such as bench press, vertical jump, and broad jump do not directly measure qualities such as decision making, technique, or football knowledge. Some position-specific drills, such as quarterback throwing or receiver catching drills, are also difficult to represent with simple numerical data.

Career AV creates another possible problem because recent players have not had the same amount of time to build their careers as older players. We will address this by either limiting the analysis to players who have had enough time to establish an NFL career or measuring performance over a fixed number of seasons.

If some Combine drills have too much missing data or do not help our predictions, we can remove them or focus on more useful measurements. We will also compare multiple measures of NFL success rather than relying completely on Career AV. If one modeling approach performs poorly, we can compare it with the other regression and classification techniques described above. These alternatives give us a way to continue the project even if part of our original approach does not work as expected.

## Footnotes

[^1]: Kuzmits, F. E., & Adams, A. J. (2008). "The NFL Combine: Does It Predict Performance in the National Football League?" Journal of Strength and Conditioning Research, 22(6), 1721–1727. https://doi.org/10.1519/JSC.0b013e318185f09d

[^2]: Robbins, D. W. (2010). "The National Football League (NFL) Combine: Does Normalized Data Better Predict Performance in the NFL Draft?" Journal of Strength and Conditioning Research, 24(11), 2888–2899. https://doi.org/10.1519/JSC.0b013e3181f927cc

[^3]: Teramoto, M., Cross, C. L., & Willick, S. E. (2016). "Predictive Value of National Football League Scouting Combine on Future Performance of Running Backs and Wide Receivers." Journal of Strength and Conditioning Research, 30(5), 1379–1390. https://doi.org/10.1519/JSC.0000000000001202

[^4]: "The Relationship Between the National Football League Scouting Combine and Game Performance Over a 5-Year Period." (2020). Journal of Strength and Conditioning Research. https://pubmed.ncbi.nlm.nih.gov/32459737/

[^5]: Rishis, E., Johnston, K., & Baker, J. (2023). "On the Predictive Validity of the National Football League Combine: Does It Forecast Future Success?" Journal of Sports Sciences, 41(3), 217–231. https://doi.org/10.1080/02640414.2023.2207853

[^6]: Doyle, B. P., Stanelle, S. T., Riechman, S. E., & Mann, J. B. (2026). "The NFL Scouting Combine Explains Within-Position Physical Performance Variance but Is a Poor Predictor of Draft Outcomes." Journal of Strength and Conditioning Research. https://doi.org/10.1519/JSC.0000000000005654

[^7]: Szekely, B., Sinnott, C., Halow, S., & Ryan, G. (2023). "NFL Career Success as Predicted by NFL Scouting Combine." arXiv. https://doi.org/10.48550/arXiv.2303.05774

{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "d41976a1",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2025-10-19T19:44:56.154903Z",
     "iopub.status.busy": "2025-10-19T19:44:56.152703Z",
     "iopub.status.idle": "2025-10-19T19:44:57.629249Z",
     "shell.execute_reply": "2025-10-19T19:44:57.627197Z"
    },
    "papermill": {
     "duration": 1.484242,
     "end_time": "2025-10-19T19:44:57.632694",
     "exception": false,
     "start_time": "2025-10-19T19:44:56.148452",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching core tidyverse packages\u001b[22m ──────────────────────── tidyverse 2.0.0 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mdplyr    \u001b[39m 1.1.4     \u001b[32m✔\u001b[39m \u001b[34mreadr    \u001b[39m 2.1.5\n",
      "\u001b[32m✔\u001b[39m \u001b[34mforcats  \u001b[39m 1.0.0     \u001b[32m✔\u001b[39m \u001b[34mstringr  \u001b[39m 1.5.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2  \u001b[39m 3.5.1     \u001b[32m✔\u001b[39m \u001b[34mtibble   \u001b[39m 3.2.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mlubridate\u001b[39m 1.9.3     \u001b[32m✔\u001b[39m \u001b[34mtidyr    \u001b[39m 1.3.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mpurrr    \u001b[39m 1.0.2     \n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\u001b[36mℹ\u001b[39m Use the conflicted package (\u001b[3m\u001b[34m<http://conflicted.r-lib.org/>\u001b[39m\u001b[23m) to force all conflicts to become errors\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'cyclistic-project-charts-v2'</li><li>'my-capstone-project-cyclistic-case-study'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'cyclistic-project-charts-v2'\n",
       "\\item 'my-capstone-project-cyclistic-case-study'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'cyclistic-project-charts-v2'\n",
       "2. 'my-capstone-project-cyclistic-case-study'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"cyclistic-project-charts-v2\"             \n",
       "[2] \"my-capstone-project-cyclistic-case-study\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# This R environment comes with many helpful analytics packages installed\n",
    "# It is defined by the kaggle/rstats Docker image: https://github.com/kaggle/docker-rstats\n",
    "# For example, here's a helpful package to load\n",
    "\n",
    "library(tidyverse) # metapackage of all tidyverse packages\n",
    "\n",
    "# Input data files are available in the read-only \"../input/\" directory\n",
    "# For example, running this (by clicking run or pressing Shift+Enter) will list all files under the input directory\n",
    "\n",
    "list.files(path = \"../input\")\n",
    "\n",
    "# You can write up to 20GB to the current directory (/kaggle/working/) that gets preserved as output when you create a version using \"Save & Run All\" \n",
    "# You can also write temporary files to /kaggle/temp/, but they won't be saved outside of the current session"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "42bd862d",
   "metadata": {
    "papermill": {
     "duration": 0.001865,
     "end_time": "2025-10-19T19:44:57.636702",
     "exception": false,
     "start_time": "2025-10-19T19:44:57.634837",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "This analysis examined how casual riders and members use Cyclistic bikes differently in order to inform marketing strategies. The data reveals that members primarily use bikes for commuting, evidenced by high volumes during the beginning and ending of the work day during the week, while casual riders use bikes for recreation, evidenced by the higher volume of non-member rides during the weekends. These insights will guide the development of targeted campaigns, including tiered membership options and digital outreach strategies.\n",
    "\n",
    "## Business Task\n",
    "\n",
    "Cyclistic's director of marketing believes that our success depends on our ability to maximize annual memberships. Financial analysis shows that members are much more profitable than casual riders. This analysis aims to clearly show the differences between casual riders and members so that marketing efforts can be focused on the specific behaviors and motivations of casual riders.\n",
    "\n",
    "## Data Source\n",
    "\n",
    "This analysis used 12 months of Cyclistic historical trip data. To ensure manageable analysis, a sample of 1,000 rides was randomly selected from each month, resulting in 12,000 total rides. Key variables analyzed included rider type, ride length, day of week, hour of day, and month.\n",
    "\n",
    "## Data Cleaning & Preparation\n",
    "\n",
    "- Randomly sampled 1,000 rides from each of the 12 monthly datasets.\n",
    "- Combined all samples into one dataset for analysis.\n",
    "- Removed starting and ending station names (incomplete data and not needed).\n",
    "- Cleaned up time stamp data for start and end time to be uniform\n",
    "- Added data columns for ride length, hour, day of week, month, and ride time buckets.\n",
    "\n",
    "## Analysis & Key Findings\n",
    "\n",
    "The analysis reveals that members and casual riders use Cyclistic bikes for fundamentally different purposes: Members use the service for commuting and casual riders use the service for recreation.  Members show consistent weekday usage while casual riders peak on weekends.\n",
    "\n",
    "/kaggle/input/cyclistic-project-charts-v2/Cyclistic Ride Count by Hour.png\n",
    "\n",
    "### Finding 1: Ride Patterns by Hour Reveal Rider Group Differences \n",
    "\n",
    "This chart shows rider usage by hour, with a higher concentration of Members using the service at 8am and 4-6pm. Casual riders are more evenly distributed throughout the hours of the day, and have only one high volume peak during the 4-6pm time frame. This shows that Cyclist members are using the service for commuting to work and from work while casual riders are using the service for leisure and recreation rather than transportation.\n",
    "\n",
    "/kaggle/input/cyclistic-project-charts-v2/Cyclistic Ride Length Buckets.png\n",
    "\n",
    "### Finding 2: Ride Duration Patterns Show Rider Differences\n",
    "\n",
    "Looking at 4 segments of typical ride lengths, we can clearly see that Cyclistic Members dominate the short ride (10 minutes or less) segment. This means they have a clear purpose and end point in mind when using the service. Members accounted for 49,793 rides under 10 minutes compared to only 17,734 for casual riders. Casual riders had much higher usage with rides over 60 minutes (1,790 vs 487), indicating more leisure use and not a clear final destination.\n",
    "\n",
    "/kaggle/input/cyclistic-project-charts-v2/Cyclistic Weekly Usage Patterns.png\n",
    "\n",
    "### Finding 3: Weekly Usage Patterns Confirm Casual vs. Member Behavior\n",
    "\n",
    "Member rides remained consistent throughout the week, with a slight drop-off on Sundays. This pattern indicates regular work commutes throughout the week. Casual riders show a clear peak on the weekends with higher usage starting as early as Friday evenings.  This pattern reinforces that casual riders primarily use Cyclistic for leisure rather than regular transportation.\n",
    "\n",
    "\n",
    "## Recommendation 1: Weekend / Leisure Focused Membership\n",
    "\n",
    "Create a weekend membership or pass product that appeals to the casual user. This membership would target fun, exploration and ease of use for moving around the city.\n",
    "\n",
    "Features Include: \n",
    "\n",
    "* Unlimited Ride Lengths \n",
    "\n",
    "* Unlimited Weekend Rides Starting Friday Evening \n",
    "\n",
    "* Lower Price Point From Annual Membership\n",
    "\n",
    "This membership tier directly addresses casual rider behavior: unlimited ride times to accommodate the long recreational rides, focus for the weekend (Friday - Sunday) aligning with peak casual usage patterns, and lower pricing, appealing to those who don't use Cyclistic for daily commuting. \n",
    "\n",
    "## Recommendation 2: Marketing Messaging Targeting Casual Riders\n",
    "\n",
    "Messaging should emphasize freedom, fun, flexibility and exploration rather than emphasizing efficiency, speed and commuting. This messaging allows us to address casual users with segmented marketing efforts and differentiate those marketing efforts from our current campaigns. Since casual riders use Cyclistic bikes for recreation (longer rides, weekend patterns), messaging that emphasizes exploration and leisure activities will resonate more than commute-focused benefits. Deploy print advertising at bike stations, digital ad campaigns, and social media with messaging like 'Explore Chicago at your own pace' and 'Your weekend has no limits' that emphasizes leisure over commuting.\n",
    "\n",
    "## Recommendation 3: Digital Targeting Strategy For Casual Riders\n",
    "\n",
    "Target casual riders who are already using Cyclistic services. Since data shows casual riders peak on weekends and evenings, these are optimal windows for conversion campaigns. Retargeting campaigns on existing social media channels, in-app messaging, and email campaigns with personalized offers keep our brand and offer top of mind when they're already engaged with the service. Deploy geo-targeted ads near high-traffic weekend routes and stations.\n",
    "\n"
   ]
  }
 ],
 "metadata": {
  "kaggle": {
   "accelerator": "none",
   "dataSources": [
    {
     "datasetId": 8522659,
     "sourceId": 13427737,
     "sourceType": "datasetVersion"
    },
    {
     "datasetId": 8528656,
     "sourceId": 13436669,
     "sourceType": "datasetVersion"
    }
   ],
   "isGpuEnabled": false,
   "isInternetEnabled": true,
   "language": "r",
   "sourceType": "notebook"
  },
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.4.0"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 5.332089,
   "end_time": "2025-10-19T19:44:57.761794",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2025-10-19T19:44:52.429705",
   "version": "2.6.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}

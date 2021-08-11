# ApexStocks Compose
<!-- #### CODY ANDERSON, QUINTON LIANG, AARON PARKER -->

Compose file for running the full stack application.

## Run on a Server
### Build the App Locally
You must track your build folder and build locally, unfortunately.
### Add Credentials to Jenkins
The following environment variables need to be added to your Jenkins
credentials as "secret text."
* KEYS_ALPHAVANTAGE
### Add API and App Pipelines
You must create the API and app pipelines before creating the Compose pipeline.
### Add Compose Pipeline
You must create the Compose pipeline with the item name "ApexStocks-Compose."
## Run Locally
### Directory Structure
Have your repositories in the same directory as shown:
```
.
├── API
├── Compose
└── portfolio_manager_frontend
```
### .env Files
You must create a .env file in `Compose` with the following content:
```
export KEYS_ALPHAVANTAGE=<AlphaVantage API Key>
```
You must also create your .env file in `porfolio_manager_frontend` with the
following content:
```
REACT_APP_API_URL=http://localhost:8081/changeme
```
### ./run.sh
The `run.sh` convenience script builds all of the dependent containers

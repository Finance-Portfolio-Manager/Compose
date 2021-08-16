# ApexStocks Compose
<!-- #### CODY ANDERSON, QUINTON LIANG, AARON PARKER -->

Compose file for running the full stack application. Uses an Nginx reverse
proxy to route requests to the same global address on port 80 to the API and
the app.
<br>
<br>
Choose your path:
* [Diagram](#diagram)
* [Run on a Server](#run-on-a-server)
* [Run Locally](#run-locally)

## Diagram
[![diagram](https://github.com/Finance-Portfolio-Manager/Compose/raw/master/diagram.png)](https://github.com/Finance-Portfolio-Manager/Compose/raw/master/diagram.png)

## Run on a Server
### Build the React App Locally
You must track your build folder and build locally, unfortunately (EC2 not
powerful enough). Create a `.env` file with
`REACT_APP_API_URL=http://apexstocks.xyz/services`.
### Add Credentials to Jenkins
The following environment variables need to be added to your Jenkins
credentials as "secret text."
* KEYS_ALPHAVANTAGE
* NEWS_API_KEY
* DB_URL
* DB_USER
* DB_PASS
### Add Pipelines
You must create the API and app pipelines before creating the Compose pipeline.
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
export DB_URL=<database address>
export DB_USER=<database username>
export DB_PASS=<database password>
export KEYS_ALPHAVANTAGE=<AlphaVantage API Key>
export NEWS_API_KEY=<News API Key>
export REACT_APP_API_URL=http://localhost/services
```
### ./run.sh
The `run.sh` convenience script builds all of the dependent containers, starts
docker compose, and launches the site in a browser.

import json
import requests  # dependency from pyproject

with open("config.json") as f:
    config = json.load(f)

print("App is running with uv environment!")
print("Loaded config:", config)

print("Making a sample HTTPS request:")
response = requests.get("https://httpbin.org/get")
print("Status:", response.status_code)

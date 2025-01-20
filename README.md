# ai-foundry-l-and-l
AI Foundry presentation and demo content

https://official.nba.com/wp-content/uploads/sites/4/2023/10/2023-24-NBA-Season-Official-Playing-Rules.pdf

https://github.com/microsoft/promptflow/discussions/996

references: 
- [azure-ai-foundry-hub-vs-project](https://learn.microsoft.com/en-us/azure/ai-studio/concepts/rbac-ai-studio#azure-ai-foundry-hub-vs-project)

Permissions for storage not cascading for some reason. To trigger this to happen, go into the storage account from the portal and attempt to add Blob Storage Contributor for the project workspace's Managed Identity


> You are a travel assistant that helps with trips to the Grand Canyon. If a question is asked for a trip unrelated to the Grand Canyon, simply respond with, "I'm sorry, but I can only assist with trips to the Grand Canyon." You are friendly and should assist users with their trips using the information provided to you in the search prompt. Only use the data provided to the search through the indexed data source. Use your internal knowledge to improve the response, but only use the provided knowledge source from the search index as your primary source.
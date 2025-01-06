Demos:
1. Review resources and Terraform
1.
1. Create index for Grand Canyon travel
1. 


# Demo - Review Resources
Navigate to the [Azure portal](https://portal.azure.com). Find the two resource groups and review the resources within the "-ai-" resource group. Review the Hub and Project within [AI Foundry](https://ai.azure.com).

# Demo - Chat Playground
Navigate to the Chat Playground within [AI Foundry](https://ai.azure.com).

Build a system prompt:
> You are a travel advisor that assists travelers in planning their trip to the Grand Canyon. Your tone is friendly and helpful. Only answer questions pertaining to Grand Canyon travel. If the questions are not pertaining to Grand Canyon travel, advise the user, "I am sorry, but I am a travel advisor that only specializes in Grand Canyon tours."

Ask some questions and observe the responses.

# Demo - RAG
Navigate to the data + indexes section in [AI Foundry](https://ai.azure.com). Upload the Grand Canyon PDF files. Observe the ML job that builds the index.

Wait for index to finish creating and then navigate to the Chat Playground within [AI Foundry](https://ai.azure.com). Use the UI to associate the data and Generate a system prompt using AI:
> You are a travel advisor that assists travelers in planning their trip to the Grand Canyon. Your tone is friendly and helpful. Use the indexed travel brochures to answer customer questions. Use your own internal knowledge source to enhance your responses, but only answer questions that have information within the indexed Grand Canyon brochures within the context.

Ask a few questions to see the responses.

# Demo - Web App Deployment
Navigate to the Chat Playground within [AI Foundry](https://ai.azure.com). Choose `Deploy` -> `...as a web app`. Create a new web app. 

Fast forward to after the deployment. Review the web apps section. Navigate to the web app. Test the app with a few questions.

Review what it creates by navigating the Deployment Center and the corresponding GitHub repo. Review the environment variables as well.


# Demo - Prompt Flow in AI Foundry
Navigate to the Chat Playground within [AI Foundry](https://ai.azure.com). Choose the option for "Prompt Flow". Give a unique name like "Grand-Canyon-Playground-Flow". Start the compute. Start a chat. 

Things to look at:
- Chat response with token usage metadata
- Graph of flow execution
- Underlying code
- Files area

Navigate to Compute to reflect the resources.

# Demo - Deploy Flow

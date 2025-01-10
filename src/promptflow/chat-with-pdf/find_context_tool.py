from promptflow.core import tool
from chat_with_pdf.find_context import find_context


@tool
def find_context_tool(question: str, index_path: str):
    prompt, context = find_context(question, index_path)

    context_text = [c.text for c in context]

    return {"prompt": prompt, "context": context_text}

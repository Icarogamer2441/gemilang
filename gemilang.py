# -*- coding: utf-8 -*-
import google.generativeai as genai


API = "YOUR GEMINI API"
genai.configure(api_key=API)

model = genai.GenerativeModel("gemini-pro")

chat = model.start_chat(history=[])

# is in portuguese but the gemini can translate to english if you put english things in your code
chat.send_message("todo conteudo de arquivo que eu mandar você interpreta como de uma linguagem de programação e executa mostrando o output")


print("use 'exit' or 'sair' to exit")
while True:
    fname = input("File name > ")

    if fname == "exit" or fname == "sair":
        break

    with open(fname, "r") as f:
        code = f.read()
    response = chat.send_message(code)
    print("Out:", response.text, "\n")

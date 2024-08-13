# -*- coding: utf-8 -*-
import google.generativeai as genai
import time
import os
import platform

def clear_screen():
    system = platform.system()

    if system == "Windows":
        os.system('cls')
    else:
        os.system('clear')

API = "YOUR GEMINI API"
genai.configure(api_key=API)

model = genai.GenerativeModel("gemini-pro")

chat = model.start_chat(history=[])

# is in portuguese but the gemini can translate to english if you put english things in your code
chat.send_message("todo conteudo de arquivo que eu mandar você interpreta como de uma linguagem de programação e executa mostrando o output desse jeito:\noutput:\n```\n<output>\n```\n\nexit code: <codigo de saida>\nnunca mostre o codigo input!")

print("press Ctrl+C to stop the program")
fname = input("File > ")
while True:
    input("Press any key to execute...")
    clear_screen()
    with open(fname, "r") as f:
        code = f.read()
    response = chat.send_message(code)
    print(response.text, "\n")

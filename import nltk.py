import nltk
import random
import string
from nltk.tokenize import word_tokenize
from nltk.corpus import stopwords
import nltk
import random
import string
from nltk.tokenize import word_tokenize
from nltk.corpus import stopwords

# Téléchargement des ressources nécessaires pour nltk
nltk.download('punkt')
nltk.download('stopwords')

class ChatBot:
    def __init__(self, name):
        self.name = name
        self.word_dict = {}
        self.stop_words = set(stopwords.words('english'))

    def learn_words(self, sentence):
        words = word_tokenize(sentence)
        words = [word.lower() for word in words if word.isalpha() and word not in self.stop_words]
        for word in words:
            if word not in self.word_dict:
                self.word_dict[word] = 1
            else:
                self.word_dict[word] += 1

    def generate_sentence(self):
        if not self.word_dict:
            return "I need to learn more words first."
        
        # Génération d'une phrase aléatoire
        words = list(self.word_dict.keys())
        sentence_length = random.randint(5, 15)  # Longueur de la phrase aléatoire
        sentence = ' '.join(random.choices(words, k=sentence_length))
        return sentence.capitalize() + '.'

# Création de deux bots de chat
bot1 = ChatBot("BotAlpha")
bot2 = ChatBot("BotBeta")

# Exemples d'apprentissage des mots par les bots
bot1.learn_words("Hello, how are you doing today? I hope you are having a great day!")
bot2.learn_words("Greetings! What are your plans for today? It's a beautiful day, isn't it?")

# Génération de phrases complexes par les bots
print(f"{bot1.name}: {bot1.generate_sentence()}")
print(f"{bot2.name}: {bot2.generate_sentence()}")

# Interaction entre les bots
for _ in range(5):
    sentence_from_bot1 = bot1.generate_sentence()
    print(f"{bot1.name}: {sentence_from_bot1}")
    bot2.learn_words(sentence_from_bot1)
    
    sentence_from_bot2 = bot2.generate_sentence()
    print(f"{bot2.name}: {sentence_from_bot2}")
    bot1.learn_words(sentence_from_bot2)

# Téléchargement des ressources nécessaires pour nltk
nltk.download('punkt')
nltk.download('stopwords')

class ChatBot:
    def __init__(self, name):
        self.name = name
        self.word_dict = {}
        self.stop_words = set(stopwords.words('english'))
        self.known_phrases = []

    def learn_words(self, sentence):
        words = word_tokenize(sentence)
        words = [word.lower() for word in words if word.isalpha() and word not in self.stop_words]
        self.known_phrases.append(sentence)
        for word in words:
            if word not in self.word_dict:
                self.word_dict[word] = 1
            else:
                self.word_dict[word] += 1

    def generate_response(self):
        if not self.word_dict:
            return "I need to learn more words first."
        
        # Génération d'une phrase en utilisant des mots connus
        words = list(self.word_dict.keys())
        sentence_length = random.randint(5, 15)  # Longueur de la phrase aléatoire
        sentence = ' '.join(random.choices(words, k=sentence_length))
        return sentence.capitalize() + '.'

    def generate_question(self):
        if not self.word_dict:
            return "I need to learn more words first."
        
        # Choisir un mot fréquent et formuler une question de manière contextuelle
        common_word = max(self.word_dict, key=self.word_dict.get)
        questions = [
            f"Can you tell me more about {common_word}?",
            f"What do you think of when you hear the word {common_word}?",
            f"How often do you use the word {common_word}?"
        ]
        return random.choice(questions)

    def interact(self, input_sentence):
        self.learn_words(input_sentence)
        response = self.generate_response()
        question = self.generate_question()
        return response, question

# Création de deux bots de chat
bot1 = ChatBot("BotAlpha")
bot2 = ChatBot("BotBeta")

# Exemples d'apprentissage des mots par les bots et interaction
input_sentences = [
    "Hello, how are you doing today? I hope you are having a great day!",
    "Greetings! What are your plans for today? It's a beautiful day, isn't it?"
]

for sentence in input_sentences:
    response1, question1 = bot1.interact(sentence)
    print(f"{bot1.name}: {response1}")
    print(f"{bot1.name}: {question1}")
    
    response2, question2 = bot2.interact(sentence)
    print(f"{bot2.name}: {response2}")
    print(f"{bot2.name}: {question2}")

# Interaction continue entre les bots
for _ in range(5):
    sentence_from_bot1 = bot1.generate_response()
    print(f"{bot1.name}: {sentence_from_bot1}")
    bot2.learn_words(sentence_from_bot1)
    
    sentence_from_bot2 = bot2.generate_response()
    print(f"{bot2.name}: {sentence_from_bot2}")
    bot1.learn_words(sentence_from_bot2)
    
    question_from_bot1 = bot1.generate_question()
    print(f"{bot1.name}: {question_from_bot1}")
    question_from_bot2 = bot2.generate_question()
    print(f"{bot2.name}: {question_from_bot2}")

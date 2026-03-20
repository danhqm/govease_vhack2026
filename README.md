# 🚀 GovEase

**A Voice-First, Multilingual AI Health Navigator for Public Services**

## 📖 About The Project
Millions of vulnerable citizens—including the elderly, rural populations, and migrant workers—are excluded from basic healthcare access due to severe language barriers and complex bureaucratic terminology. 

**GovEase** bridges this "Information Gap." It is a mobile application designed for low-digital-literacy users that translates dense government documents into conversational, 5th-grade level regional dialects (like standard Malay, Indonesian slang, Thai, Vietnamese, and Bengali). By utilizing a strict Retrieval-Augmented Generation (RAG) pipeline, GovEase ensures that every AI response is 100% grounded in verified official policy, completely eliminating AI hallucinations.

## ✨ Key Features
* **🎙️ Voice-First Interface:** Designed for accessibility, featuring an intuitive speech-to-text engine for users who struggle with typing.
* **🌍 Dialect-Aware Translation:** Goes beyond standard translation by simplifying complex concepts into natural, conversational dialects.
* **🛡️ Verified Accuracy (Zero Hallucinations):** Every chat response includes a "View Source" button that connects directly to the official government document used to generate the answer.
* **⚡ Seamless Multilingual Onboarding:** Users select their preferred language before entering the app, ensuring true linguistic inclusivity from second one.

## 💻 Tech Stack
* **Frontend:** Flutter & Dart (Mobile App)
* **Backend:** Python & FastAPI 
* **AI / LLM:** Hugging Face Inference API (Qwen 2.5 7B-Instruct)
* **Architecture:** Retrieval-Augmented Generation (RAG) pipeline to anchor AI responses to official government PDFs.

## 🛠️ How It Works
1. The user speaks or types a query in their native language (e.g., *"Kalo apotek buka jam berapa?"*).
2. The Flutter frontend sends the query and target dialect to the FastAPI backend.
3. The backend retrieves the relevant official government context (e.g., Ministry of Health guidelines).
4. The Hugging Face LLM processes the official context and simplifies it into user-friendly bullet points.
5. The response is routed back to the mobile UI alongside a verifiable citation link.

---
*Built with ❤️ for Varsity Hackathon 2026.*


To run the project

1. Type cd backend_api
2. Type uvicorn main:app --reload
3. Run main.dart

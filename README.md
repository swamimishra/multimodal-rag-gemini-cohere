# 👁️ Vision RAG App with Gemini 2.5 Flash

A powerful **Multimodal Retrieval-Augmented Generation (RAG)** application that allows you to chat with your PDF documents. Unlike standard RAG, this app can "see" and retrieve visual information (charts, graphs, diagrams) along with text.

**Screenshots**
<img width="1919" height="917" alt="image" src="https://github.com/user-attachments/assets/39fd9582-0ee4-4476-8831-1fb53d0bb6ad" />

<img width="1919" height="914" alt="image" src="https://github.com/user-attachments/assets/ba797a4c-95f3-4cde-aa7e-0450b1351940" />

**Powered by:**
*   **Gemini 2.5 Flash** (Google) for multimodal reasoning.
*   **Cohere Embed v3/v4** for semantic search (Text + Image embeddings).
*   **FAISS** for efficient vector retrieval.
*   **Streamlit** for the user interface.

---

## ✨ Features
*   **Multimodal Search**: Retrieves both text chunks and page images relevant to your query.
*   **Visual Q&A**: Asks Gemini to answer based on the retrieved visual context (e.g., "Explain the trend in this chart").
*   **Interactive UI**: Drag-and-drop PDF ingestion.
*   **Hybrid Storage**: Uses FAISS for embeddings and local storage for metadata.

---

## 🚀 Deployment (Hugging Face Spaces)
This app is optimized for deployment on **Hugging Face Spaces** using **Docker**.

1.  **Create a Space**: Select **Docker** as the SDK and "Blank" as the template.
2.  **Upload Files**: Upload all files from this repository (ensure `core/`, `Dockerfile`, and `packages.txt` are included).
3.  **Set Secrets**: Go to **Settings -> Variables and secrets** and add:
    *   `GEMINI_API_KEY`: Your Google Gemini API Key.
    *   `COHERE_API_KEY`: Your Cohere API Key.
4.  **Run**: The app will build and launch automatically.

---

## 🛠️ Local Installation

### Prerequisites
*   Python 3.9+ 
*   **Poppler**: Required for PDF processing.
    *   *Windows*: Download from [poppler-windows](https://github.com/oschwartz10612/poppler-windows/releases) and add `bin/` to PATH.
    *   *Linux*: `sudo apt-get install poppler-utils`
    *   *Mac*: `brew install poppler`

### Steps
1.  **Clone the repo**
    ```bash
    git clone <your-repo-url>
    cd multimodal-rag-demo
    ```

2.  **Install Dependencies**
    ```bash
    pip install -r requirements.txt
    ```

3.  **Configure Keys**
    Create a `.env` file or set environment variables:
    ```bash
    export GEMINI_API_KEY="your_key"
    export COHERE_API_KEY="your_key"
    ```
    *(Or update `config.py` directly for local testing)*

4.  **Run the App**
    ```bash
    streamlit run app.py
    ```

### ⚠️ Note for Python 3.14 Users (Windows)
If you encounter a `TypeScript/Protobuf` error, set this environment variable before running:
```cmd
set PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=python
```

---

## 📂 Project Structure
```
├── app.py              # Main Streamlit application
├── config.py           # Configuration & Secrets management
├── core/               # Core logic
│   ├── embeddings.py   # Cohere embedding interactions
│   ├── document_utils.py # PDF processing & FAISS
│   └── search.py       # RAG search logic
├── data/               # Stores the vector index (FAISS) - Optional for deployment
├── Dockerfile          # Configuration for Hugging Face/Docker
└── packages.txt        # System dependencies (Poppler) for Linux
```

## 📜 License
Apache 2.0


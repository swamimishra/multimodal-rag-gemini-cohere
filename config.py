import os
import streamlit as st

# Secrets Management for Hugging Face Spaces
# 1. Set these in your Space Settings -> Secrets
# 2. Key names: COHERE_API_KEY, GEMINI_API_KEY

COHERE_API_KEY = os.environ.get("COHERE_API_KEY") or st.secrets.get("COHERE_API_KEY")
GEMINI_API_KEY = os.environ.get("GEMINI_API_KEY") or st.secrets.get("GEMINI_API_KEY")

GEMINI_MODEL = "gemini-2.5-flash"

# Deepfake Detection on Social Media Leveraging Deep Learning & FastText Embeddings

A Django-based web application that leverages Deep Learning (CNN) and Machine Learning models (Naive Bayes, Logistic Regression, Decision Tree, Random Forest, Gradient Boosting, XGBoost, and an Extension Hybrid CNN) to identify machine-generated (fake) tweets.

---

## 🚀 How to Run Locally

### Prerequisites
1. **Python 3.7**: This project relies on older versions of TensorFlow (1.14.0) and Keras (2.3.1), which require Python 3.7. (You can use the installer executable `python-3.7.6-amd64.exe` included in this repository to install it if not already done).
2. **Pip**: Make sure pip is installed.

### Step-by-Step Local Setup
1. **Open Command Prompt (cmd)** in this folder.
2. **Install the dependencies**:
   ```bash
   pip install -r requirements.txt
   ```
3. **Download NLTK Data**:
   ```bash
   python nltkdownload.py
   ```
4. **Run Database Migrations**:
   ```bash
   python manage.py migrate
   ```
5. **Start Django Server**:
   Double click the `run.bat` file or run:
   ```bash
   python manage.py runserver
   ```
6. Open your browser and go to: `http://127.0.0.1:8000/`

---

## 🌐 How to Deploy Live (Free on Hugging Face Spaces)

Hugging Face Spaces provides **16GB RAM for free**, which is perfect for hosting this TensorFlow deep learning app without crashing.

### Step 1: Create a Hugging Face Account & Space
1. Go to [Hugging Face](https://huggingface.co/) and sign up for a free account.
2. Click on **Spaces** in the top navigation bar, then click **Create new Space**.
3. Fill out the details:
   - **Space Name:** `deepfake-detection` (or any name you like)
   - **License:** `mit` (or choose another)
   - **Select SDK:** Click **Docker**.
   - **Docker Template:** Choose **Blank**.
   - **Space Visibility:** **Public** (so anyone can see it).
4. Click **Create Space**.

### Step 2: Push Code to your Space
Once the Space is created, Hugging Face will show you Git instructions. It will look like this:
1. **Add the Hugging Face Space as a remote:**
   ```bash
   git remote add space https://huggingface.co/spaces/YOUR_USERNAME/YOUR_SPACE_NAME
   ```
2. **Push the code to the Space:**
   ```bash
   git push -f space main
   ```
3. Wait 2-3 minutes for the build to finish. Hugging Face will build the Docker container and start your website!

---

## 📂 Project Structure

- `Deep/` - Django configuration directory (settings, URLs, etc.)
- `DeepApp/` - Django application directory (views, models, templates, and static assets)
- `Dataset/` - Tweepfake dataset used for training the classifiers
- `model/` - Contains the saved model weights (`cnn_weights.hdf5` and `tfidf.pckl`)
- `Dockerfile` - Container setup for hosting on Hugging Face Spaces
- `.gitignore` - Excludes temporary files and the large `X.npy` file (auto-generated on startup)

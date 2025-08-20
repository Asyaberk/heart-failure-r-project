# ❤️ Heart Failure Prediction in R

## 📖 Story & Motivation
This project is an exploration of the [Heart Failure Prediction dataset](https://www.kaggle.com/datasets/fedesoriano/heart-failure-prediction). I wanted to apply clustering, outlier detection, and logistic regression to a dataset that is both medically relevant and statistically rich. With 918 patient records and 12 features, this dataset provided the perfect chance to combine **statistical modeling** with **practical healthcare insights**.

## 🔍 Project Flow
The analysis followed a clear and structured path:

### 1️⃣ Understanding the Dataset
- Imported the CSV (`heart.csv`) into R.
- Explored its structure with `str()`, `summary()`, and `head()`.
- Counted unique values per column to distinguish categorical vs numeric features.
- Checked for missing values (none were found).

### 2️⃣ Clustering Analysis
- Selected key numeric features: **Age, RestingBP, Cholesterol, MaxHR, Oldpeak**.
- Standardized them with `scale()`.
- Determined the optimal number of clusters using the **Elbow Method** → k = 3.
- Applied **K-means clustering** with 3 groups and visualized the clusters with PCA.

### 3️⃣ Outlier Detection
- Used boxplots to identify extreme values in numeric variables.
- Findings:
  - **Cholesterol** had very high outliers (> 400 mg/dL).
  - **RestingBP** showed values > 160 mm Hg.
  - **Oldpeak** revealed outliers > 4.0, linked to severe ST depression.
- Age showed no significant outliers.

### 4️⃣ Logistic Regression (Visualization)
- Plotted logistic regression of **Cholesterol vs HeartDisease** using `glm(family = binomial)`.
- The curve revealed dataset-specific patterns, showing cholesterol levels are not the only predictor of heart disease.

### 5️⃣ Logistic Regression (Modeling)
- Built a logistic regression model with predictors:
  `Age, Cholesterol, MaxHR, Oldpeak, FastingBS, Sex, ChestPainType`
- Examined coefficients and significance levels.
- Key predictors: **Oldpeak, MaxHR, FastingBS, Sex, ChestPainType**.
- Results aligned with medical intuition (e.g., higher ST depression = higher disease risk).

### 6️⃣ Model Evaluation
- Predictions converted into binary labels with a 0.5 threshold.
- Evaluated with a **Confusion Matrix**:
  - Accuracy: **81.26%**
  - Sensitivity: **77.56%**
  - Specificity: **84.25%**
  - Kappa: **0.62** (substantial agreement)
- Balanced accuracy (~81%) confirmed the model’s reliability across classes.

## 📊 Results & Insights
- **Clustering** revealed three patient subgroups.
- **Outliers** highlighted high-risk patients with extreme cholesterol and Oldpeak values.
- **Logistic Regression** identified medically significant predictors of heart disease.
- The model achieved **strong predictive accuracy (81%)**, proving statistical and clinical validity.

## 📂 Repository Structure
```
.
├── heart.R                   # Main R script
├── heart.csv                 # Dataset (ignored in .gitignore if excluded)
└── presentation/             # Presentation materials & plots
    ├── Asya_Berk_Heart_Failure_Presentation.pdf
    └── plots/
        ├── cluster.png
        ├── outlier_age.png
        ├── outlier_cholesterol.png
        ├── regression_curve.png
        └── more...
```

## 🚀 How to Run
1. Clone the repository:
   ```bash
   git clone https://github.com/Asyaberk/heart-failure-prediction-r.git
   ```
2. Download the dataset from [Kaggle](https://www.kaggle.com/datasets/fedesoriano/heart-failure-prediction) if not included.
3. Place `heart.csv` in the project root.
4. Run the analysis in R:
   ```R
   source("heart.R")
   ```

## 🙋‍♀️ Author
👩‍💻 **Asya Berk**  
CMPE343 – Business Intelligence and Applied Analytics  
Spring 2025  

---

✨ This project shows how **data science and healthcare** can meet. Through clustering, outlier detection, and logistic regression, we not only predicted heart disease but also uncovered patterns that could guide further medical insights.


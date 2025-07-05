# 🔗 Rails URL Shortener

A simple Ruby on Rails application that shortens long URLs and generates short redirectable.

---

## 📂 Project Setup

### ✅ Prerequisites

- Ruby (>= 3.2)
- Rails (>= 7)
- Bundler (`gem install bundler --user-install`)
- SQLite3 (for development)

---

### 🛠️ To Run Locally

1. **Clone the repository**

```bash
git clone https://github.com/your-username/url-shortener.git
cd url-shortener
```

2. **Install dependencies locally**

```bash
bundle install --path vendor/bundle
```

3. **Set up the database**

```bash
bundle exec rails db:create db:migrate
```

4. **Start the development server**

```bash
bundle exec rails server
```

Then visit 👉 `http://[::1]:3000`

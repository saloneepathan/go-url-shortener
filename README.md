# Go URL Shortener

A simple URL shortener service built with **Go**.  
It allows you to shorten long URLs into short codes and redirect users back to the original URLs.

---

## 🚀 Features
- Shorten long URLs into short random codes.
- Redirect short URLs to their original targets.
- In-memory storage (no database required).
- Lightweight and easy to run.

---

## 🛠️ Tech Stack
- **Go** (net/http)
- **JSON API**
- (Optional) Docker

---

## 📦 Installation & Setup

### Clone the repository
```bash
git clone https://github.com/your-username/go-url-shortener.git
cd go-url-shortener
````

### Initialize & run

```bash
go run main.go
```

Server will start at:

```
http://localhost:8080
```

---

## 🔗 API Endpoints

### 1. Shorten a URL

**POST** `/shorten`

Request Body:

```json
{
  "url": "https://www.google.com"
}
```

Response:

```json
{
  "short_url": "http://localhost:8080/abc123"
}
```

---

### 2. Redirect

**GET** `/{shortCode}`

Example:

```
http://localhost:8080/abc123
```

➡️ Redirects to the original URL.

---

## 🧪 Example with cURL

Shorten a URL:

```bash
curl -X POST http://localhost:8080/shorten \
  -H "Content-Type: application/json" \
  -d '{"url": "https://www.google.com"}'
```

Response:

```json
{
  "short_url": "http://localhost:8080/xyz789"
}
```

Visit:

```bash
curl -i http://localhost:8080/xyz789
```

Output:

```http
HTTP/1.1 302 Found
Location: https://www.google.com
```

---

## 🐳 Run with Docker (Optional)

### Build Image

```bash
docker build -t go-url-shortener .
```

### Run Container

```bash
docker run -p 8080:8080 go-url-shortener
```

---

## 📝 Future Improvements

* Persist URLs in a database (SQLite/Postgres).
* Add expiration times for short URLs.
* Add analytics (click tracking).
* Build a simple frontend UI.

---

## 📄 License

This project is licensed under the **MIT License**.
See [LICENSE](LICENSE) for details.

# Autolandia 🚗

WPF-приложение для менеджеров и бухгалтеров автомобильного бизнеса с клиентским веб-сайтом.

![Autolandia](https://img.shields.io/badge/Status-In%20Development-blue)
![.NET](https://img.shields.io/badge/.NET-8.0-purple)
![Vue](https://img.shields.io/badge/Vue-3-green)
![MySQL](https://img.shields.io/badge/MySQL-8.0-orange)

## 🏗️ Архитектура проекта

```mermaid
graph TB
    A[WPF Client<br/>Менеджеры/Бухгалтеры] --> B[ASP.NET Core Web API]
    C[Vue.js Web Client<br/>Клиенты] --> B
    B --> D[MySQL Database]

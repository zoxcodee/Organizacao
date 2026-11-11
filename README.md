# 💎 MoneyMap

Controle financeiro com contas salvas na nuvem (Supabase) e site estático na Vercel.

## 1. Criar o banco (grátis)
1. Crie um projeto em supabase.com.
2. SQL Editor → New query → cole o conteúdo de `supabase.sql` → Run.
3. Project Settings → API → copie a **Project URL** e a chave **anon public**.
4. (Opcional) Authentication → Providers → Email → desative "Confirm email" para entrar logo após criar a conta.
5. Authentication → URL Configuration → coloque o link do seu site da Vercel em **Site URL**.

## 2. Configurar o app
No início do `index.html`, troque os dois valores:
```js
const SUPABASE_URL='https://xxxx.supabase.co', SUPABASE_KEY='sua-chave-anon-public';
```
A chave anon é pública por design; a proteção dos dados vem das regras de segurança (RLS) do `supabase.sql`.

## 3. Publicar
Envie os arquivos ao GitHub; a Vercel atualiza o site sozinha.

## Tipos de conta
No cadastro a pessoa escolhe como vai usar o app:
- **🙋 Uso pessoal**: dashboard, lançamentos, categorias, metas, anotações e cofrinho (sem aba de Vendas).
- **🛍️ Vendedor**: tudo do uso pessoal + aba **Vendas** (produto/serviço, cliente, valor, controle do que falta receber) e o card "Vendas a receber" no dashboard.

O tipo fica salvo dentro dos dados do usuário (`finance_data.data.type`), então **não precisa alterar o banco**. Contas criadas antes desta mudança escolhem o tipo na próxima vez que entrarem, e qualquer pessoa pode trocar depois em **Perfil → Tipo de conta**. Ao ocultar Vendas, os dados continuam guardados.

Desenvolvido por **ZoxCode**.

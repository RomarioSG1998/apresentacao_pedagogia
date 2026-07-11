# Guia de Estudos: Análise Linha por Linha do `Program.cs`

Este documento foi criado para ajudar a entender e estudar detalhadamente o funcionamento de cada linha do arquivo [Program.cs](file:///home/romario-jala/Área de trabalho/programação 3 - Labs/lab_week_1/src/LabWeek1Activity1/Program.cs).

---

## 🛠️ Parte 1: Estrutura Base e Parâmetros da CLI (Linhas 1 a 22)

```csharp
1: using System;
2: 
3: class Program
4: {
5:     static void Main(string[] args)
6:     {
```
* **Linha 1 (`using System;`)**: Importa o namespace `System`. Namespaces são bibliotecas de classes. O `System` contém classes essenciais da plataforma .NET, como a classe `Console` (usada para ler/escrever no terminal) e a exceção `InvalidCastException`.
* **Linha 3 (`class Program`)**: Declara uma classe chamada `Program`. Em C#, todo código executável precisa residir dentro de uma classe ou estrutura.
* **Linha 5 (`static void Main(string[] args)`)**: 
  * `static`: Indica que o método pertence à classe `Program` em si, e não a uma instância específica dela.
  * `void`: O método não retorna nenhum valor após a execução.
  * `Main`: O ponto de entrada padrão (entry point) de qualquer aplicativo C# executável.
  * `string[] args`: Um vetor (array) de strings que captura os parâmetros digitados na linha de comando (CLI) quando executamos o programa.

```csharp
7:         Console.WriteLine("==================================================");
8:         Console.WriteLine("Parameters received on execution:");
9:         if (args.Length == 0)
10:         {
11:             Console.WriteLine("No parameters were passed via the command line.");
12:         }
```
* **Linhas 7 e 8**: Escrevem cabeçalhos estáticos no terminal usando `Console.WriteLine()`.
* **Linha 9 (`if (args.Length == 0)`)**: Verifica se o tamanho do vetor `args` é zero. Se for zero, significa que nenhum argumento foi passado no terminal.
* **Linha 11**: Imprime a mensagem informando que nenhum parâmetro foi recebido.

```csharp
13:         }
14:         else
15:         {
16:             for (int i = 0; i < args.Length; i++)
17:             {
18:                 Console.WriteLine($"Parameter [{i}]: {args[i]}");
19:             }
20:         }
21:         Console.WriteLine("==================================================");
22:         Console.WriteLine();
```
* **Linha 14 (`else`)**: Executado caso `args.Length` seja maior que zero.
* **Linha 16 (`for (int i = 0; i < args.Length; i++)`)**: Um loop `for` que inicializa o contador `i` em `0`, repete enquanto `i` for menor que o número de parâmetros passados e incrementa `i` de `1` em `1`.
* **Linha 18 (`Console.WriteLine(...)`)**: Imprime o parâmetro no formato `Parameter [index]: valor`. 
  * `$` antes das aspas indica uma **interpolação de string**, que permite inserir variáveis diretamente dentro da string usando chaves `{}`.
* **Linhas 21 e 22**: Finalizam a seção de parâmetros e pulam uma linha.

---

## 🔄 Parte 2: Execução das Conversões no `Main` (Linhas 23 a 51)

```csharp
23:         Console.WriteLine("=== Executing Data Conversions ===");
24:         
25:         int intVal1 = 42;
26:         int intVal2 = 100000;
27:         ConvertIntToShortAndLong(intVal1);
28:         ConvertIntToShortAndLong(intVal2);
```
* **Linhas 25 e 26**: Declaram duas variáveis do tipo inteiro de 32 bits (`int`). `intVal1` recebe `42` e `intVal2` recebe `100000`.
* **Linhas 27 e 28**: Chamam a função `ConvertIntToShortAndLong`, passando essas duas variáveis como argumentos, uma de cada vez.

```csharp
30:         float floatVal = 123.45f;
31:         int intValForFloat = 987;
32:         ConvertFloatToIntAndIntToFloat(floatVal, intValForFloat);
```
* **Linha 30**: Declara um número de ponto flutuante de precisão simples (`float`). O sufixo `f` (ou `F`) é obrigatório para indicar ao C# que o literal `123.45` é um `float` (caso contrário, o compilador assume que é `double`).
* **Linha 31**: Declara um inteiro `intValForFloat` com o valor `987`.
* **Linha 32**: Chama a função `ConvertFloatToIntAndIntToFloat`.

```csharp
34:         int intValForDouble = 555;
35:         ConvertIntToDouble(intValForDouble);
36: 
37:         ConvertBoolToString(true);
38:         ConvertBoolToString(false);
39: 
40:         ConvertIntToString(8888);
```
* **Linhas 34 e 35**: Criam um inteiro e chamam o método para converter para `double`.
* **Linhas 37 e 38**: Chamam o método de conversão de boleano para string passando diretamente os literais lógicos `true` e `false`.
* **Linha 40**: Chama a conversão de `int` para `string` com o número literal `8888`.

```csharp
42:         int intValForBoxing = 777;
43:         object boxedObj = ConvertToBoxing(intValForBoxing);
```
* **Linha 42**: Declara o tipo de valor inteiro `intValForBoxing`.
* **Linha 43**: Chama o método `ConvertToBoxing` (que retorna um tipo `object`) e armazena a referência retornada na variável `boxedObj` de tipo de referência `object`.

```csharp
45:         if (boxedObj != null)
46:         {
47:             ConvertUnboxingToInt(boxedObj);
48:         }
49:         
50:         Console.WriteLine("==================================================");
51:     }
```
* **Linha 45 (`if (boxedObj != null)`)**: Verifica se o objeto retornado não é nulo.
* **Linha 47**: Chama o método `ConvertUnboxingToInt` para extrair o valor original encapsulado em `boxedObj` de volta para `int`.
* **Linha 51**: Fecha a chave do método `Main`.

---

## 🔀 Parte 3: Métodos de Conversão (Linhas 53 a 113)

### 3.1 Conversão de `int` para `short` e `int` para `long`

```csharp
53:     static void ConvertIntToShortAndLong(int val)
54:     {
55:         Console.WriteLine($"\n[Conversion: int to short and int to long] - Original Value: {val}");
56:         short shortVal = (short)val;
57:         Console.WriteLine($"  int to short (explicit): {val} -> {shortVal}");
58:         long longVal = val;
59:         Console.WriteLine($"  int to long (implicit): {val} -> {longVal}");
60:     }
```
* **Linha 56 (`short shortVal = (short)val;`)**: 
  * O tipo `short` armazena no máximo 16 bits (valores de `-32.768` a `32.767`). O `int` possui 32 bits.
  * Por ser uma conversão de um tipo maior para um menor (**Downcasting**), o compilador do C# impede que ela ocorra de forma automática devido ao risco de perda de dados.
  * O operador `(short)` realiza um **casting explícito**.
  * **Comportamento com Overflow**: Na execução, quando passamos `42`, ele cabe no short e exibe `42`. Quando passamos `100000` (que excede `32767`), ocorre um estouro binário (overflow), resultando no valor truncado `-31072`.
* **Linha 58 (`long longVal = val;`)**:
  * O tipo `long` (64 bits) é maior que o `int` (32 bits) (**Upcasting**).
  * Como não há perigo de perda de dados, o C# faz essa conversão de forma **automática (implícita)**. Não há necessidade de colocar `(long)`.

---

### 3.2 Conversão de `float` para `int` e `int` para `float`

```csharp
62:     static void ConvertFloatToIntAndIntToFloat(float fVal, int iVal)
63:     {
64:         Console.WriteLine($"\n[Conversion: float to int and int to float]");
65:         int intVal = (int)fVal;
66:         Console.WriteLine($"  float to int (explicit): {fVal}f -> {intVal}");
67:         float convertedFloat = iVal;
68:         Console.WriteLine($"  int to float (implicit): {iVal} -> {convertedFloat}f");
69:     }
```
* **Linha 65 (`int intVal = (int)fVal;`)**:
  * Converter de `float` (número com ponto flutuante) para `int` (número inteiro) exige casting explícito `(int)`.
  * Isso ocorre porque há perda de precisão (as casas decimais são descartadas). `123.45` vira `123` (truncamento puro, sem arredondamento).
* **Linha 67 (`float convertedFloat = iVal;`)**:
  * O `int` pode ser convertido para `float` implicitamente. O valor `987` se torna `987.0f`.

---

### 3.3 Conversão de `int` para `double`

```csharp
71:     static void ConvertIntToDouble(int val)
72:     {
73:         Console.WriteLine($"\n[Conversion: int to double]");
74:         double doubleVal = val;
75:         Console.WriteLine($"  int to double (implicit): {val} -> {doubleVal}");
76:     }
```
* **Linha 74 (`double doubleVal = val;`)**:
  * O tipo `double` (64 bits) pode representar qualquer valor inteiro de 32 bits perfeitamente. A conversão é feita de forma implícita.

---

### 3.4 Conversões de Tipos de Dados para String

```csharp
78:     static void ConvertBoolToString(bool val)
79:     {
80:         Console.WriteLine($"\n[Conversion: bool to string]");
81:         string strVal = val.ToString();
82:         Console.WriteLine($"  bool to string (ToString): {val} -> \"{strVal}\"");
83:     }
84: 
85:     static void ConvertIntToString(int val)
86:     {
87:         Console.WriteLine($"\n[Conversion: int to string]");
88:         string strVal = val.ToString();
89:         Console.WriteLine($"  int to string (ToString): {val} -> \"{strVal}\"");
90:     }
```
* **Linhas 81 e 88 (`val.ToString()`)**:
  * Em C#, todos os tipos (tanto tipos de valor quanto tipos de referência) herdam direta ou indiretamente da classe base `System.Object`.
  * A classe `Object` define o método virtual `ToString()`.
  * Chamar `val.ToString()` executa a sobrescrita (override) desse método no tipo correspondente, gerando a representação textual do dado (`"True"`/`"False"` para boolianos, e `"8888"` para inteiros).

---

### 3.5 Boxing (Conversão para Objeto)

```csharp
92:     static object ConvertToBoxing(int val)
93:     {
94:         Console.WriteLine($"\n[Boxing: int to object]");
95:         object obj = val;
96:         Console.WriteLine($"  boxing: int({val}) -> object (Runtime type: {obj.GetType()})");
97:         return obj;
98:     }
```
* **Linha 95 (`object obj = val;`)**:
  * O `int` é um **tipo de valor** (armazenado na memória **Stack**).
  * O `object` é um **tipo de referência** (armazenado na memória **Heap**).
  * **Boxing** é o processo de converter um tipo de valor em um tipo de referência. O C# cria um "embrulho" (wrapper) na memória Heap e copia o valor da Stack para lá.
  * Ocorre implicitamente quando atribuímos `val` para `obj`.
* **Linha 96 (`obj.GetType()`)**:
  * Embora o tipo da variável `obj` seja do tipo estático `object`, o método `GetType()` lê os metadados do wrapper na Heap em tempo de execução (runtime), revelando que o dado real empacotado é um `System.Int32` (`int`).

---

### 3.6 Unboxing (Extração de Valor de um Objeto)

```csharp
100:     static void ConvertUnboxingToInt(object obj)
101:     {
102:         Console.WriteLine($"\n[Unboxing: object to int]");
103:         try
104:         {
105:             int val = (int)obj;
106:             Console.WriteLine($"  unboxing: object -> int({val})");
107:         }
108:         catch (InvalidCastException ex)
109:         {
110:             Console.WriteLine($"  Unboxing error: {ex.Message}");
111:         }
112:     }
```
* **Linha 103 (`try`)**: Inicia um bloco de tentativa. Se alguma exceção (erro em tempo de execução) ocorrer ali dentro, a execução é interrompida e desviada para o bloco `catch`.
* **Linha 105 (`int val = (int)obj;`)**:
  * **Unboxing** é o processo reverso do boxing. Ele extrai o tipo de valor de dentro de um objeto.
  * Diferente do boxing, o unboxing **exige** um casting explícito `(int)`.
  * Além disso, o casting de unboxing é extremamente rígido: você deve converter o objeto exatamente para o tipo original que foi empacotado (`int` neste caso). Tentar converter um `int` empacotado em `object` diretamente para um `double` ou `short` resultará em um erro em tempo de execução.
* **Linha 108 (`catch (InvalidCastException ex)`)**: Captura o erro específico de conversão inválida (como no caso mencionado acima), impedindo que a aplicação pare de responder (crash) e permitindo que o erro seja tratado ou impresso na tela.

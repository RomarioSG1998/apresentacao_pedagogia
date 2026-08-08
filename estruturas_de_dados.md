# Estruturas de Dados e POO: Java vs C#

Este documento apresenta diagramas visuais em **Mermaid** para comparar a utilização de Estruturas de Dados e Programação Orientada a Objetos (POO) entre **Java** e **C#**, bem como um fluxograma para tomada de decisão no uso de cada estrutura.

---

## 1. Mapa Mental (Mindmap)

Mapa conceitual organizando a relação de Arrays, Listas, Dicionários e especificidades de tipos entre Java e C#.

```mermaid
mindmap
  root((Estruturas de Dados e POO))
    Java
      Arrays
        Unidimensionais: int[]
        Denteados: int[][]
      Listas
        ArrayList: Redimensionável em Heap
        LinkedList: Duplamente encadeada
      Dicionarios
        HashMap: Chave-Valor
        TreeMap: Ordenado por Árvore
      Tipos Primitivos vs Wrappers
        Autoboxing em Generics
    CSharp
      Arrays
        Unidimensionais: int[]
        Denteados: int[][]
        Multidimensionais: int[,]
      Listas
        List_T: Desempenho nativo com Structs
        LinkedList_T: Duplamente encadeada
      Dicionarios
        Dictionary_TKey_TValue: Tabela Hash de alta performance
        SortedDictionary: Ordenado por Árvore Red-Black
      Generics Nativo
        Sem Boxing/Unboxing para Structs
```

---

## 2. Fluxograma de Decisão (Graph TD)

Árvore de decisão guiada para seleção da estrutura de dados ideal conforme os requisitos de tamanho, tipo de acesso e ordenação.

```mermaid
graph TD
    A[Necessidade de Estrutura de Dados] --> B{Tamanho Fixo?}
    
    B -- Sim --> C{Matriz Multidimensional?}
    C -- Matriz Retangular --> C1["C#: int[,] (Nativo)"]
    C -- Matriz Denteada --> C2["Java: int[][] <br> C#: int[][]"]
    
    B -- Não --> D{Acesso por Chave?}
    
    D -- Sim --> E{Necessita Ordenação?}
    E -- Sim --> E1["Java: TreeMap<K,V> <br> C#: SortedDictionary<TKey,TValue>"]
    E -- Não --> E2["Java: HashMap<K,V> <br> C#: Dictionary<TKey,TValue>"]
    
    D -- Não --> F{Acesso Aleatório Rápido O(1)?}
    F -- Sim --> F1["Java: ArrayList<T> <br> C#: List<T>"]
    F -- Não --> F2["Java: LinkedList<T> <br> C#: LinkedList<T>"]
```

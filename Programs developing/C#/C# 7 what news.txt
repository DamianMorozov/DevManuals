====================================================================================================
C# 7. What news.
====================================================================================================
1. Улучшения числовых литералов.
  Числовые литералы могул включать символы _:
    int million = 1_000_000;
  С помощью префикса 0b указываются двоичные литералы:
    var b = 0b1010_1011_1100_0000_0000_1111;
----------------------------------------------------------------------------------------------------
2. Переменные out и отбрасывание.
    int.TryParse ("234", out var result2);
  Отбрасывание
    if (int.TryParse (numberString, out _))   // Discard out argument
      "Valid number".Dump();
    else
      "Invalid number".Dump();
----------------------------------------------------------------------------------------------------
3. Шаблоны.
  Pattern matching "is-expression" (Шаблонные переменные)
    object foo = "Hello, world";
    if (foo is string s)
      s.Length.Dump();
  Pattern matching "switch"
    void Demo (Control control)
    {
      switch (control)
      {
        case TextBox t:              // Switch on type
          t.Multiline.Dump();
          break;
        case null:                   // The 'null' literal is legal here
          "Null".Dump();
          break;
        default:
          "Unknown".Dump();
          break;
      }
    }
----------------------------------------------------------------------------------------------------

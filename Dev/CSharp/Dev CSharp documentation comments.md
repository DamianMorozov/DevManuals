# Dev CSharp documentation comments

- [Back to the Home](../../../README.md)
- [Back to the Dev](../../README.md)
- [Back to the section](README.md)

## Links
- [Recommended XML tags for C# documentation comments](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/xmldoc/recommended-tags "learn.microsoft.com")


## General tags

### <summary>
```
<summary>description</summary>
```

### <remarks>
```
<remarks>
description
</remarks>
```


## Document members

### <returns>
```
<returns>description</returns>
```

### <param>
```
<param name="name">description</param>
```

### <paramref>
```
<paramref name="name"/>
```

### <exception>
```
<exception cref="member">description</exception>
```

### <value>
```
<value>property-description</value>
```


## Format documentation output

### <para>
```
<remarks>
    <para>
        This is an introductory paragraph.
    </para>
    <para>
        This paragraph contains more details.
    </para>
</remarks>
```

### <list>
```
<list type="bullet|number|table">
    <listheader>
        <term>term</term>
        <description>description</description>
    </listheader>
    <item>
        <term>Assembly</term>
        <description>The library or executable built from a compilation.</description>
    </item>
</list>
```

### <c>
The <c> tag gives you a way to indicate that text within a description should be marked as code. Use <code> to indicate multiple lines as code.
```
<c>text</c>
```

### <code>
```
<code>
    var index = 5;
    index++;
</code>
```

### <example>
```
<example>
This shows how to increment an integer.
<code>
    var index = 5;
    index++;
</code>
</example>
```


### Reuse documentation text

### <inheritdoc>
```
<inheritdoc [cref=""] [path=""]/>
```

### <include>
```
<include file='filename' path='tagpath[@name="id"]' />
```

### example <include>
```
namespace MyNamespace;
public class MyType
{
    /// <returns>This is the returns text of MyMethod. It comes from triple slash comments.</returns>
    /// <remarks>This is the remarks text of MyMethod. It comes from triple slash comments.</remarks>
    /// <include file="MyAssembly.xml" path="doc/members/member[@name='M:MyNamespace.MyType.MyMethod']/*" />
    public int MyMethod(int p) => p;
}
```


## Generate links and references

### <see>
```
<see cref="member"/>
<!-- or -->
<see cref="member">Link text</see>
<!-- or -->
<see href="link">Link Text</see>
<!-- or -->
<see langword="keyword"/>
```

### <seealso>
```
<seealso cref="member"/>
<!-- or -->
<seealso href="link">Link Text</seealso>
```


## Generic types and methods

### <typeparam>
```
<typeparam name="TResult">The type returned from this method</typeparam>
```

### <typeparamref>
```
<typeparamref name="TKey"/>
```


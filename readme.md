# PHP Útvonalak

## .htaccess
A .htaccess biztosítja, hogy minden kérés az index.php-ra fusson rá (Front Controller minta), kivéve ha valós fájlt vagy mappát keresünk

```apache
RewriteEngine On
RewriteBase /vegpontok/

# Ha a kért fájl (-f) vagy könyvtár (-d) létezik, ne nyúlj hozzá
RewriteCond %{REQUEST_FILENAME} -f [OR]
RewriteCond %{REQUEST_FILENAME} -d
RewriteRule ^ - [L] 

# Minden más kérést irányíts az index.php-ra
RewriteRule ^ index.php [L]
```

- [L] jelző: "Last" – ha ez a szabály teljesül, a szerver nem vizsgálja a többi szabályt.

## Dinamikus Útvonalválasztó (Router)
Ez a kódrészlet felel azért, hogy a böngészőbe írt URL-t (pl. /vegpontok/) összekösse a szerveren lévő fájlokkal.

```php
$requestUri = strtok($_SERVER['REQUEST_URI'], '?');
$basePath = '/vegpontok'; 

if (str_starts_with($requestUri, $basePath)) {
    $path = substr($requestUri, strlen($basePath));
}
```

- Szép URL-ek: Nem kell kiírni, hogy otthon.php, elég a /. Ez profibb és biztonságosabb (nem látszik a fájlszerkezet).
- Magic Constant (__DIR__): Az abszolút útvonal használatával elkerüljük az "el nem érhető fájl" hibákat, bárhová is mozgatjuk a mappákat a szerveren belül.
- A cél, hogy a kódunk hordozható legyen: ne kelljen minden fájlban kézzel átírni az elérési utakat, ha átnevezzük a projekt mappáját.
- $alapUtvonal: Meghatározzuk a projekt "gyökér" mappáját (a projekt nevét), így a kód bárhol működik.

## A mágikus DIR
Ahelyett, hogy tippelgetnénk, hol van a fájlunk a szerver merevlemezén, a PHP beépített állandóját használjuk a stabil hivatkozáshoz.

```php
<?php 
    $kertUtvonal = strtok($_SERVER['REQUEST_URI'], '?');
    $alapUtvonal = "/vegpontok";
    if (str_starts_with($kertUtvonal, $alapUtvonal)){
        $utvonal = substr($kertUtvonal, strlen($alapUtvonal));
    }
    $utvonalak = [
        "/" => __DIR__."/nezetek/otthon.php",
    ];
    if (isset($utvonalak[$utvonal])){
        require_once $utvonalak[$utvonal];
    }
?>
```

- Fizikai elérési út: A __DIR__ mindig a jelenlegi fájl teljes mappaszerkezetét adja vissza (pl. C:\xampp\htdocs...).
- Magic Constant: Azért "mágikus", mert az értéke automatikusan változik attól függően, hogy melyik fájlban írtad le.

.class public Landroid/app/ServiceImpl;
.super Ljava/lang/Object;
.source "ServiceImpl.java"

# interfaces
.implements Landroid/app/ServiceStub;


# instance fields
.field private mCachedFields:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/reflect/Field;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private cacheAndSetField(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 8

    :try_start_0
    invoke-virtual {p1, p2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p3, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1b

    invoke-virtual {v0, v1, p3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v1, p0, Landroid/app/ServiceImpl;->mCachedFields:Ljava/util/LinkedHashMap;

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1b} :catch_1c

    :cond_1b
    goto :goto_20

    :catch_1c
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_20
    return-void
.end method

.method private static isDroidGuardService(Landroid/app/Service;)Z
    .registers 3

    invoke-virtual {p0}, Landroid/app/Service;->getApplication()Landroid/app/Application;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.google.android.gms"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_24

    invoke-virtual {p0}, Landroid/app/Service;->getClassName()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "droidguard"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_24

    const/4 v0, 0x1

    goto :goto_25

    :cond_24
    const/4 v0, 0x0

    :goto_25
    return v0
.end method

.method private static setField(Ljava/lang/reflect/Field;Ljava/lang/Object;)Z
    .registers 4

    const/4 v0, 0x1

    :try_start_1
    invoke-virtual {p0, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    const/4 v1, 0x0

    invoke-virtual {p0, v1, p1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_8} :catch_9

    return v0

    :catch_9
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public attach(Landroid/app/Service;)V
    .registers 5

    invoke-static {p1}, Landroid/app/ServiceImpl;->isDroidGuardService(Landroid/app/Service;)Z

    move-result v0

    if-eqz v0, :cond_3a

    iget-object v0, p0, Landroid/app/ServiceImpl;->mCachedFields:Ljava/util/LinkedHashMap;

    if-nez v0, :cond_3a

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Landroid/app/ServiceImpl;->mCachedFields:Ljava/util/LinkedHashMap;

    const-class v0, Landroid/os/Build;

    const-string v1, "DEVICE"

    const-string v2, "walleye"

    invoke-direct {p0, v0, v1, v2}, Landroid/app/ServiceImpl;->cacheAndSetField(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v1, "PRODUCT"

    invoke-direct {p0, v0, v1, v2}, Landroid/app/ServiceImpl;->cacheAndSetField(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v1, "MODEL"

    const-string v2, "Pixel 2"

    invoke-direct {p0, v0, v1, v2}, Landroid/app/ServiceImpl;->cacheAndSetField(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v1, "FINGERPRINT"

    const-string v2, "google/walleye/walleye:8.1.0/OPM1.171019.011/4448085:user/release-keys"

    invoke-direct {p0, v0, v1, v2}, Landroid/app/ServiceImpl;->cacheAndSetField(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V

    const-class v0, Landroid/os/Build$VERSION;

    const-string v1, "DEVICE_INITIAL_SDK_INT"

    const/16 v2, 0x1a

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Landroid/app/ServiceImpl;->cacheAndSetField(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_3a
    return-void
.end method

.method public detachAndCleanUp(Landroid/app/Service;)V
    .registers 6

    iget-object v0, p0, Landroid/app/ServiceImpl;->mCachedFields:Ljava/util/LinkedHashMap;

    if-eqz v0, :cond_2e

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_2c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    :try_start_19
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/reflect/Field;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v3, v2, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_26} :catch_27

    goto :goto_c

    :catch_27
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_c

    :cond_2c
    iput-object v2, p0, Landroid/app/ServiceImpl;->mCachedFields:Ljava/util/LinkedHashMap;

    :cond_2e
    return-void
.end method

# classes.dex

.class public Landroid/app/ApplicationStub;
.super Ljava/lang/Object;
.source "ApplicationStub.java"

# static fields
.field private static mMiuiApplicationThread:Lmiui/process/IMiuiApplicationThread;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/4 v0, 0x0

    sput-object v0, Landroid/app/ApplicationStub;->mMiuiApplicationThread:Lmiui/process/IMiuiApplicationThread;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static onCreate(Landroid/app/Application;)V
    .registers 3

    invoke-static {}, Lmiui/contentcatcher/InterceptorProxy;->addMiuiApplication()V

    invoke-static {p0}, Lmiui/util/TypefaceUtils;->recordApplication(Landroid/app/Application;)V

    if-eqz p0, :cond_8d

    invoke-virtual {p0}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.google.android.gms"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_25

    const-string v1, "com.google.android.apps.photos"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_25

    const-string v1, "com.androidfung.drminfo"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_25

    goto :goto_4d

    :cond_25
    const-string v0, "BRAND"

    const-string v1, "google"

    invoke-static {v0, v1}, Landroid/app/ApplicationStub;->setBuildField(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "PRODUCT"

    const-string v1, "marlin"

    invoke-static {v0, v1}, Landroid/app/ApplicationStub;->setBuildField(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "DEVICE"

    invoke-static {v0, v1}, Landroid/app/ApplicationStub;->setBuildField(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "MANUFACTURER"

    const-string v1, "Google"

    invoke-static {v0, v1}, Landroid/app/ApplicationStub;->setBuildField(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "MODEL"

    const-string v1, "Pixel XL"

    invoke-static {v0, v1}, Landroid/app/ApplicationStub;->setBuildField(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "FINGERPRINT"

    const-string v1, "google/marlin/marlin:12/QP1A.191005.007.A3/5972272:user/release-keys"

    invoke-static {v0, v1}, Landroid/app/ApplicationStub;->setBuildField(Ljava/lang/String;Ljava/lang/String;)V

    :goto_4d
    const-string v1, "com.vng.pubgmobile"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_86

    const-string v1, "com.netease.lztgglobal"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_86

    const-string v1, "com.pubg.imobile"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_86

    const-string v1, "com.pubg.newstate"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_86

    const-string v1, "com.riotgames.league.wildrift"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_86

    const-string v1, "com.riotgames.league.wildriftvn"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_86

    const-string v1, "com.riotgames.league.wildrifttw"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_86

    goto :goto_8d

    :cond_86
    const-string v0, "MODEL"

    const-string v1, "SO-52A"

    invoke-static {v0, v1}, Landroid/app/ApplicationStub;->setBuildField(Ljava/lang/String;Ljava/lang/String;)V

    :cond_8d
    :goto_8d
    return-void
.end method

.method private static setBuildField(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    :try_start_0
    const-class v0, Landroid/os/Build;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_11} :catch_12

    goto :goto_16

    :catch_12
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_16
    return-void
.end method

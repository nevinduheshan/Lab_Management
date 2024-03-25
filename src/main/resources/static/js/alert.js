function msgBox(title, message, position) {
    if (title === "success") {
        iziToast.show({
            title: 'Success',
            titleColor: 'green',
            message: message,
            messageColor: 'green',
            icon: 'fas fa-check',
            iconColor: 'green',
            color: 'green',
            position: position,
            timeout: 5000,
        });
    } else if (title === "error") {
        iziToast.show({
            title: 'Error',
            titleColor: 'red',
            message: message,
            messageColor: 'red',
            icon: 'fas fa-xmark',
            iconColor: 'red',
            color: 'red',
            position: position,
            timeout: 5000,
        });
    } else if (title === "warning") {
        iziToast.show({
            title: 'Warning',
            message: message,
            titleColor: 'black',
            icon: 'fas fa-exclamation-triangle',
            iconColor: 'black',
            color: 'orange',
            position: position,
            timeout: 5000,
        });
    }
}
